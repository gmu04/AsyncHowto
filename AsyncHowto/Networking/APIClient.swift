// APIClient.swift by Gokhan Mutlu on 20.10.2024

import Foundation
import Combine

protocol APIClient: AnyObject{
	func getData(_ completion:@escaping (Result<Data, NetworkError>)->())
	func getData() -> AnyPublisher<[Post], Error>
	func getData() async throws -> Data
}
