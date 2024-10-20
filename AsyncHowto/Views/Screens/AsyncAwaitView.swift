// AsyncAwaitView.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI

struct AsyncAwaitView: View {
	@ObservedObject private var vm = PostsByAsyncAwaitVM()
	
    var body: some View {
        Text("🍐 Async\\Await")
			.font(.title)
		
		Text("Not implemented")
			.font(.largeTitle)
			.foregroundStyle(.red)
			.padding()

		
		PostsListView(posts: vm.posts)
			.listStyle(.plain)
    }
}

#Preview {
    AsyncAwaitView()
}
