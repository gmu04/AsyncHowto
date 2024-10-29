// AsyncAwaitView.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI

struct AsyncAwaitView: View {
	@ObservedObject private var vm = PostsByAsyncAwaitVM()
	
	var body: some View {
		VStack {
			Text("🍐 Async\\Await")
				.font(.title)
			
			PostsListView(posts: vm.posts)
				.listStyle(.plain)
			
			/*Text("Not implemented")
				.font(.largeTitle)
				.foregroundStyle(.red)
				.padding()*/
		}
		.task {
			await vm.getPosts()
		}
	}
}

#Preview {
	AsyncAwaitView()
}
