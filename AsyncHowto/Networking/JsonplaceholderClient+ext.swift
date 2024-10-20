// JsonplaceholderClient+rxt.swift by Gokhan Mutlu on 20.10.2024

import Foundation
import Combine


extension JsonplaceholderClient{
	
	func getData() -> AnyPublisher<[Post], Error>{
		//check - url valid
		guard let urlValid = URL(string: urlStr) else{
			return Fail(error: NetworkError.invalidURL)
				.eraseToAnyPublisher()
		}
		
		let publisher =
		URLSession.shared.dataTaskPublisher(for: urlValid)
			.map(\.data)
			.decode(type: [Post].self, decoder: JSONDecoder())
			.receive(on: DispatchQueue.main)
			.catch { error -> AnyPublisher<[Post], Error> in
				Just([])
					.setFailureType(to: Error.self)
					.eraseToAnyPublisher()
			}
			.eraseToAnyPublisher()
		
		return publisher
	}
}
