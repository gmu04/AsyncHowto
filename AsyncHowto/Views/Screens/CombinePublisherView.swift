// CombinePublisherView.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI

struct CombinePublisherView: View {
	@ObservedObject private var vm = PostsByCombineVM()
	
    var body: some View {
        Text("🍊 Combine.Publisher")
			.font(.title)
		
		PostsListView(posts: vm.posts)
			.listStyle(.plain)

    }
}

#Preview {
    CombinePublisherView()
}
