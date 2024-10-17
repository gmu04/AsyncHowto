// GCD.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI

struct GCDView: View {
	@ObservedObject private var postListVM = PostListVM()
	
    var body: some View {
		Text("🍎 GCD")
			.font(.title)
		List{
			ForEach(postListVM.posts, id: \.id){ post in
				HStack {
					Text("#\(post.id)")
						.font(.title3)
					Text(post.title)
						.font(.caption)
				}
			}
		}
		.listStyle(.plain)
    }
}

#Preview {
    GCDView()
}
