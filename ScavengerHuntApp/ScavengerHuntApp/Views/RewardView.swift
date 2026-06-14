//
//  RewardView.swift
//  ScavengerHuntApp
//
//  Created by AZAMBOU Marcel on 2026-06-06.
//

import SwiftUI

struct RewardView: View {
    let items: [HuntItem]

    private var foundCount: Int {
        items.filter { $0.isFound }.count
    }

    private var rewardMessage: String {
        if foundCount >= 10 {
            return "20% Discount + Grand Prize Draw"
        } else if foundCount >= 7 {
            return "20% Discount"
        } else if foundCount >= 5 {
            return "10% Discount"
        } else {
            return "No Reward Yet"
        }
    }

    private var nextGoalMessage: String {
        if foundCount < 5 {
            return "Find \(5 - foundCount) more item(s) to unlock a 10% discount."
        } else if foundCount < 7 {
            return "Find \(7 - foundCount) more item(s) to unlock a 20% discount."
        } else if foundCount < 10 {
            return "Find \(10 - foundCount) more item(s) to enter the grand prize draw."
        } else {
            return "You found every item and unlocked the top reward."
        }
    }

    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 10) {
                Image(systemName: "gift.fill")
                    .font(.system(size: 54))
                    .foregroundColor(.blue)

                Text("Rewards")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("\(foundCount) of \(items.count) items found")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }

            VStack(spacing: 12) {
                Text(rewardMessage)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Text(nextGoalMessage)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))

            NavigationLink {
                SubmitResultView(foundCount: foundCount, rewardMessage: rewardMessage)
            } label: {
                Text("Submit Results")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)

            Spacer()
        }
        .padding()
        .navigationTitle("Rewards")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        RewardView(items: [.preview])
    }
}
