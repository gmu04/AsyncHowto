// ContentView.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationStack {
			List{
				Text("Get \"posts\" from\njsonplaceholder.typicode.com")
					.italic()
				
				NavigationLinkView<GCDView>(
					img:"🍎", name: "GCD (Grand Central Dispatch)") { GCDView() }
				
				NavigationLinkView<OperationQueueView>(
					img:"🍒", name: "Operation Queue") { OperationQueueView() }
				
				NavigationLinkView<CombinePublisherView>(
					img:"🍊", name: "Combine - Publisher") { CombinePublisherView() }

				NavigationLinkView<AsyncAwaitView>(
					img:"🍐", name: "Async\\Await") { AsyncAwaitView() }
				
			}
			.listStyle(.plain)
			.padding()
			//.navigationBarTitleDisplayMode(.inline)
			.navigationTitle("Async Howto")
		}
	}
}

#Preview {
	ContentView()
}


