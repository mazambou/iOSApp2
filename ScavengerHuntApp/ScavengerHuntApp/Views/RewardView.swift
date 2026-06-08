//
//  RewardView.swift
//  ScavengerHuntApp
//
//  Created by AZAMBOU Marcel on 2026-06-06.
//

import SwiftUI

struct RewardView: View {
    let foundCount: Int

    private var rewardMessage: String {
        if foundCount >= 10 {
            return "20% coupon + grand prize draw"
        } else if foundCount >= 7 {
            return "20% coupon"
        } else if foundCount >= 5 {
            return "10% coupon"
        } else {
            return "No reward yet"
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Rewards")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Items found: \(foundCount)")
                .font(.title3)

            Text(rewardMessage)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            Spacer()
        }
        .padding()
        .navigationTitle("Rewards")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        RewardView(foundCount: 7)
    }
}
