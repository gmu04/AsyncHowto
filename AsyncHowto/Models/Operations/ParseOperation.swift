// ParseOperation.swift by Gokhan Mutlu on 18.10.2024

import Foundation

class ParseOperation: AsyncOperation{
	
	var data:Data?
	private(set) var posts:[Post] = []
	
	override init() {
		super.init()
		self.name = "Parse Operation"
	}
	
	override func main() {
		super.main()
		print("\(name ?? "").main starts - \(Thread.current.description)")
		
		guard let data = data else{
			state = .finished
			return
		}
		self.posts = AppDecoder.decodePostsDataToArray(data)
		state = .finished
	}
	
	deinit {
		print("\(name ?? "").deinit")
	}
}
