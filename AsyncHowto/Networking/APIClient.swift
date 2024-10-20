// APIClient.swift by Gokhan Mutlu on 20.10.2024

import Foundation
	
protocol APIClient: AnyObject{
	func getData(_ completion:@escaping (Result<Data, NetworkError>)->())
	
}
