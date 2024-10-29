// PostsByAsyncAwaitVM.swift by Gokhan Mutlu on 18.10.2024

import Foundation


class PostsByAsyncAwaitVM: ObservableObject{
	@Published var posts = [Post]()
	private let client = JsonplaceholderClient()
	
	
	init() {
		//getPosts()
	}
	
	func getPosts() async{
		do{
			let data = 
				//try await client.getData()
				try await client.getDataWithContinuation()
			
			let posts = AppDecoder.decodePostsDataToArray(data)
			if !posts.isEmpty{
				DispatchQueue.main.async { [weak self] in
					guard let self = self else{ return }
					self.posts = posts
				}
			}
			
		}catch{
			print("ERR: \(error)")
		}
	}

//	func getPostsWithContinuation() async{
//		await withCheckedContinuation { continuation in
//
//
//		}
//	}

}
