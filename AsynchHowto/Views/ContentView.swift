// ContentView.swift by Gokhan Mutlu on 17.10.2024

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationStack {
			VStack {
				List{
					NavigationLinkView<GCDView>(
						img:"🍎", name: "GCD (Grand Central Dispatch)") { GCDView() }
					
					NavigationLinkView<OperationQueueView>(
						img:"🍒", name: "Operation Queue") { OperationQueueView() }
					
					NavigationLinkView<AsyncAwaitView>(
						img:"🍐", name: "AsyncAwait") { AsyncAwaitView() }
					
					NavigationLinkView<CombinePublisherView>(
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


