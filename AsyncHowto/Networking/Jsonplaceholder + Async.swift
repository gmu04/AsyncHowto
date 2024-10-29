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
}
