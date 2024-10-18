// GCD.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI

struct GCDView: View {
	@ObservedObject private var vm = PostsByGCDVM()
	
    var body: some View {
		Text("🍎 GCD")
			.font(.title)
		
		PostsListView(posts: vm.posts)
			.listStyle(.plain)
    }
}

#Preview {
    GCDView()
}
