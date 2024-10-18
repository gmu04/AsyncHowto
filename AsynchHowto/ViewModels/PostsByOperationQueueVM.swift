// PostsByOperationQueueVM.swift by Gokhan Mutlu on 18.10.2024

import SwiftUI

class PostsByOperationQueueVM: ObservableObject{
	@Published var posts = [Post]()
	private var operationQueue = OperationQueue()
	
	init() {
		getPosts()
	}
	
	private func getPosts(){
		let downloadOperation = DownloadOperation()
		let parseOperation = ParseOperation()
		let blockOperation = BlockOperation { [weak downloadOperation, weak parseOperation] in
			guard let downloadOp = downloadOperation, let parseOp = parseOperation else{ return }
			parseOp.data = downloadOp.data
		}

		blockOperation.addDependency(downloadOperation)
		parseOperation.addDependency(blockOperation)
		
		operationQueue.addOperations([downloadOperation, blockOperation, parseOperation], waitUntilFinished: false)
		
		operationQueue.waitUntilAllOperationsAreFinished()
		DispatchQueue.main.async { [weak self] in
			guard let self = self else{ return }
			self.posts = parseOperation.posts
		}
	}
}
