// AsyncAwaitView.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI

struct AsyncAwaitView: View {
	@ObservedObject private var vm = PostsByAsyncAwaitVM()
	
    var body: some View {
        Text("🍐 AsyncAwait")
			.font(.title)
		
		PostsListView(posts: vm.posts)
			.listStyle(.plain)
    }
}

#Preview {
    AsyncAwaitView()
}
