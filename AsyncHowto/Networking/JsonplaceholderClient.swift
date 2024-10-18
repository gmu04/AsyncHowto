// JsonplaceholderClient.swift by Gokhan Mutlu on 17.10.2024

import Foundation

protocol APIClient: AnyObject{
	func fetchData(_ completion:@escaping (Result<Data, NetworkError>)->())
}

enum NetworkError: Error{
	case invalidURL
	case error(String)
	case error(err:Error)
	case parsingData
	
}

final class JsonplaceholderClient: APIClient{
	
	/**
	 Fetch posts data from jsonplaceholder API
	 */
	func fetchData(_ completion:@escaping (Result<Data, NetworkError>)->()){
		
		//check - url valid
		let urlStr = "https://jsonplaceholder.typicode.com/posts"
		guard let urlValid = URL(string: urlStr) else{ return completion(.failure(.invalidURL)) }
		
		let request = URLRequest(url: urlValid)
		let dataTask =
		URLSession.shared.dataTask(with: request) { data, urlResponse, error in
			//check - no http error
			guard error == nil else{
				return completion(.failure(.error(err: error!)))
			}
			
			//check - http status 200
			if let httpResponse = urlResponse as? HTTPURLResponse, httpResponse.statusCode != 200{
				return completion(.failure(.error("ERR: httpResponse - statusCode: \(httpResponse.statusCode)")))
			}
			
			//check data is valid
			guard let dataValid = data else{
				return completion(.failure(.error("Invalid data")))
			}
			
			//SUCCESS
			completion(.success(dataValid))
		}
		
		dataTask.resume()
	}
	
	
}
