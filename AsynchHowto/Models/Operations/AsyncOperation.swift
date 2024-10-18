// AsyncOperation.swift by Gokhan Mutlu on 18.10.2024

import Foundation

class AsyncOperation: Operation{

	override init() {
		super.init()
		self.name = "Async Operation"
	}
	
	var state:State = .ready{
		willSet{
			willChangeValue(forKey: state.keyPath)
			willChangeValue(forKey: newValue.keyPath)
		}
		didSet{
			didChangeValue(forKey: oldValue.keyPath)
			didChangeValue(forKey: state.keyPath)
		}
	}
	
	override var isReady: Bool{ super.isReady && state == .ready }
	override var isExecuting: Bool{ state == .executing }
	override var isFinished: Bool{ state == .finished }
	override var isAsynchronous: Bool{ true }
	
	override func cancel() {
		state = .finished
	}
	
	override func start() {
		if isCancelled{
			state = .finished
			return
		}
		state = .executing
		self.main()
	}
	
}

extension AsyncOperation{
	enum State:String{
		case ready, executing, finished
		
		var keyPath:String{
			"is\(self.rawValue.capitalized)"
		}
	}
}
