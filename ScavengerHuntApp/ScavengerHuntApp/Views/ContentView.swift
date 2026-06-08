//
//  ContentView.swift
//  ScavengerHuntApp
//
//  Created by AZAMBOU Marcel on 2026-06-05.
//

import SwiftUI

struct ContentView: View {
    @State private var items: [HuntItem] = HuntItemData().loadHuntItemData()

    private var foundCount: Int {
        items.filter { $0.isFound }.count
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Text("Item")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Business")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                .padding(.vertical, 8)

                List($items) { $item in
                    NavigationLink {
                        HuntItemDetailView(item: $item)
                    } label: {
                        HStack {
                            Text(item.name)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text(item.businessName)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Scavenger Hunt")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    NavigationLink("Rewards") {
                        RewardView(foundCount: foundCount)
                    }

                    NavigationLink("Submit") {
                        SubmitResultView(foundCount: foundCount)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
