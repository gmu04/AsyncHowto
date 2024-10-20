// PostsByCombineVM.swift by Gokhan Mutlu on 18.10.2024

import SwiftUI
import Combine

class PostsByCombineVM: ObservableObject{
	@Published var posts = [Post]()

	private let client = JsonplaceholderClient()
	private var cancelables:Set<AnyCancellable> = []
	
	init() {
		getPosts()
	}
	
	private func getPosts(){
		client.getData()
			.sink { completion in
				switch completion{
				case .finished:
					print("get data finished")
				case .failure(let err):
					print("ERR: \(err.localizedDescription)")
				}
				
			} receiveValue: { posts in
				self.posts = posts
			}
			.store(in: &cancelables)
	}
		
}
