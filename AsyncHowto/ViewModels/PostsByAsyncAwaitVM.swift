// PostsByAsyncAwaitVM.swift by Gokhan Mutlu on 18.10.2024

import Foundation


class PostsByAsyncAwaitVM: ObservableObject{
	@Published var posts = [Post]()
	
	init() {
		getPosts()
	}
	
	private func getPosts(){

	}
		
}
