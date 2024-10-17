// ContentView.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationStack {
			VStack {
				List{
					NavItemView<GCDView>(name: "GCD") { GCDView() }
					NavItemView<NSOperationView>(name: "NSOperations") { NSOperationView() }
					NavItemView<AsyncAwaitView>(name: "AsyncAwait") { AsyncAwaitView() }
					NavItemView<CombinePublisherView>(name: "Combine.Publisher") { CombinePublisherView() }
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
	var name:String
	@ViewBuilder let content: Content
	
	var body: some View {
		NavigationLink {
			content
		} label: {
			HStack {
				Text("use \(name)")
				Image(systemName: "chevron.right")
			}
			.padding(10)
		}

	}
}
