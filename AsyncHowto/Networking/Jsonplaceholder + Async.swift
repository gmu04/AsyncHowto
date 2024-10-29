// JsonplaceholderClient+ext2.swift by Gokhan Mutlu on 29.10.2024

import Foundation

extension JsonplaceholderClient{
	
	func getData() async throws -> Data{
		//check - url valid
		guard let urlValid = URL(string: urlStr) else{ throw NetworkError.invalidURL }
		
		do{
			let (data, _ /*urlResponse*/) =
				try await URLSession.shared.data(from: urlValid)
				
			return data
		}catch{
			throw NetworkError.exception(error: error)
		}
	}
	
	
	/**
	 Convert a callback function into async/wait function
	 */
	func getDataWithContinuation() async throws -> Data{
		return try await withCheckedThrowingContinuation { continuation in
			//legacy callback function
			self.getData { completion in
				switch completion{
					case .success(let data):
						continuation.resume(returning: data)
					case .failure(let networkError):
						continuation.resume(throwing: networkError)
				}
			}
		}
	}	
	
}
