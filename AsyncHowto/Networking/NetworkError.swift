// NetworkError.swift by Gokhan Mutlu on 20.10.2024

import Foundation

enum NetworkError: Error{
	case invalidURL
	case exception(String)
	case exception(error:Error)
	case parsingData
	
}
