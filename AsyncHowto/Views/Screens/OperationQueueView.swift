// NSOperationView.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI

struct OperationQueueView: View {
	@ObservedObject private var vm = PostsByOperationQueueVM()
	
	var body: some View {
		VStack {
			Text("🍒 Operation Queue")
				.font(.title)

			PostsListView(posts: vm.posts)
				.listStyle(.plain)
		}
	}
}

#Preview {
    OperationQueueView()
}


