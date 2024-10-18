// PostListMV.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI
import Combine

class PostsByGCDVM: ObservableObject{
	@Published var posts = [Post]()
	
	init() {
		getPosts()
	}
	
	private func getPosts(){
		let client = JsonplaceholderClient()
		client.fetchData { result in
			//print(posts)
			switch result{
				case .success(let data):
					DispatchQueue.main.async { [weak self] in
						guard let self = self else{ return }
						self.posts = AppDecoder.decodePostsDataToArray(data)
					}
				case .failure(let networkError):
					print(networkError)
			}
		}
	}
			
}
