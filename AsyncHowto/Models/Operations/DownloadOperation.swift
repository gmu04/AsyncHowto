// DownloadOperation.swift by Gokhan Mutlu on 18.10.2024

import Foundation

class DownloadOperation: AsyncOperation{
	
	private(set) var data:Data?
	private let client = JsonplaceholderClient()
	
	override init() {
		super.init()
		self.name = "Download Operation"
	}

	override func main() {
		super.main()
		print("\(name ?? "").main starts - \(Thread.current.description)")
		
		client.getData { result in
			switch result{
				case .success(let data):
						self.data = data
					
				case .failure(let networkError):
					print(networkError)
			}
			
			self.state = .finished
		}
	}
	
	deinit {
		print("\(name ?? "").deinit")
	}
}
