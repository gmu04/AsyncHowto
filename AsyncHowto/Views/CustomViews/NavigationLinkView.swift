// NavigationLinkView.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI

struct NavigationLinkView<Content: View>: View {
	var img:String
	var name:String
	@ViewBuilder let content: Content
	
	var body: some View {
		NavigationLink {
			content
		} label: {
			HStack {
				Text(img)
					.padding(.trailing, 10)
					.font(.title)
				Text("\(name)")
				
			}
			.padding(10)
		}

	}
}

#Preview {
	NavigationLinkView(img: "🐝", name: "Preview title", content: { Color.pink })
}
