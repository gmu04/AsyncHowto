// NetworkError.swift by Gokhan Mutlu on 20.10.2024

import Foundation

enum NetworkError: Error{
	case invalidURL
	case error(String)
	case error(err:Error)
	case parsingData
	
}
