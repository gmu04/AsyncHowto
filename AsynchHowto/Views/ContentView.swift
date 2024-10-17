// ContentView.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationStack {
			VStack {
				List{
					NavItemView<GCDView>(
						img:"🍎", name: "GCD (Grand Central Dispatch)") { GCDView() }
					NavItemView<NSOperationView>(
						img:"🍒", name: "NSOperations") { NSOperationView() }
					NavItemView<AsyncAwaitView>(
						img:"🍐", name: "AsyncAwait") { AsyncAwaitView() }
					NavItemView<CombinePublisherView>(
						img:"🍊", name: "Combine.Publisher") { CombinePublisherView() }
				}
				.listStyle(.plain)
			}
			.padding()
			.navigationTitle("Async Howto")
		}
    }
}

#Preview {
    ContentView()
}

struct NavItemView<Content: View>: View {
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
