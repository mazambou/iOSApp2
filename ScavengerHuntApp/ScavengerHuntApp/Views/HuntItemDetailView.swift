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
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 280)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                VStack(alignment: .leading, spacing: 8) {
                    Text(item.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .lineLimit(2)

                    Label(item.businessName, systemImage: "building.2.fill")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Clue")
                        .font(.headline)

                    Text(item.clue)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))

                statusView

                Button {
                    item.isFound = true
                } label: {
                    Label(item.isFound ? "Item Found" : "Mark as Found", systemImage: item.isFound ? "checkmark.circle.fill" : "checkmark.circle")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .disabled(item.isFound)
            }
            .padding()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var statusView: some View {
        HStack {
            Label(item.isFound ? "Found" : "Not Found", systemImage: item.isFound ? "checkmark.seal.fill" : "clock.fill")
                .font(.headline)
                .foregroundColor(item.isFound ? .green : .orange)

            Spacer()
        }
        .padding()
        .background((item.isFound ? Color.green : Color.orange).opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    @Previewable @State var previewItem = HuntItem.preview

    NavigationStack {
        HuntItemDetailView(item: $previewItem)
    }
}
