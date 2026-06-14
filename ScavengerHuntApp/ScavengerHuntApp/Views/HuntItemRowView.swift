//
//  HuntItemRowView.swift
//  ScavengerHuntApp
//
//  Created by AZAMBOU Marcel on 2026-06-06.
//

import SwiftUI

struct HuntItemRowView: View {
    let item: HuntItem

    var body: some View {
        HStack(spacing: 12) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 52, height: 52)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)

                Text(item.businessName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }

            Spacer()

            Image(systemName: item.isFound ? "checkmark.circle.fill" : "circle")
                .font(.title3)
                .foregroundColor(item.isFound ? .green : .secondary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    HuntItemRowView(item: .preview)
        .padding()
}
