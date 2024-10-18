// PostsListView.swift by Gokhan Mutlu on 18.10.2024

import SwiftUI

struct PostsListView: View {
	let posts:[Post]
	
	var body: some View {
		List{
			ForEach(posts, id: \.id){ post in
				HStack {
					Text("#\(post.id)")
						.font(.title3)
					Text(post.title)
						.font(.caption)
				}
			}
		}
	}
}

#Preview {
	PostsListView(posts: [])
}
