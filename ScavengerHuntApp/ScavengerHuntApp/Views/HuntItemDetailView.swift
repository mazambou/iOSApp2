//
//  HuntItemDetailView.swift
//  ScavengerHuntApp
//
//  Created by AZAMBOU Marcel on 2026-06-06.
//

import SwiftUI

struct HuntItemDetailView: View {
    @Binding var item: HuntItem

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(item.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(item.businessName)
                .font(.title3)
                .foregroundColor(.secondary)

            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 260)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 8) {
                Text("Clue")
                    .font(.headline)

                Text(item.clue)
            }

            Text("Status: \(item.isFound ? "Found" : "Not Found")")
                .font(.headline)
                .foregroundColor(item.isFound ? .green : .red)

            Button("Mark as Found") {
                item.isFound = true
            }
            .buttonStyle(.borderedProminent)
            .disabled(item.isFound)

            Spacer()
        }
        .padding()
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        HuntItemDetailView(
            item: .constant(
                HuntItem(
                    name: "Golden Coffee Cup",
                    businessName: "Coffee House",
                    imageName: "goldenCoffeeCupImg",
                    clue: "Look near the coffee machine"
                )
            )
        )
    }
}
