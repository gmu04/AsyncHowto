// PostsByCombineVM.swift by Gokhan Mutlu on 18.10.2024

import SwiftUI
import Combine

class PostsByCombineVM: ObservableObject{
	@Published var posts = [Post]()
	
	init() {
		getPosts()
	}
	
	private func getPosts(){
		
	}
		
}
