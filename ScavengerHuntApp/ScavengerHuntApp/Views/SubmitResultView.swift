//
//  SubmitResultView.swift
//  ScavengerHuntApp
//
//  Created by AZAMBOU Marcel on 2026-06-06.
//

import SwiftUI

struct SubmitResultView: View {
    let foundCount: Int
    let rewardMessage: String

    @State private var submitted = false

    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 10) {
                Image(systemName: submitted ? "checkmark.circle.fill" : "paperplane.fill")
                    .font(.system(size: 58))
                    .foregroundColor(submitted ? .green : .blue)

                Text("Submit Results")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Review your progress before submitting.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }

            VStack(alignment: .leading, spacing: 16) {
                ResultSummaryRow(title: "Items Found", value: "\(foundCount)")
                Divider()
                ResultSummaryRow(title: "Reward", value: rewardMessage)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))

            Button {
                submitted = true
            } label: {
                Text(submitted ? "Submitted" : "Submit Results")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(submitted)

            if submitted {
                Text("Successfully submitted. Your reward status has been recorded.")
                    .font(.headline)
                    .foregroundColor(.green)
                    .multilineTextAlignment(.center)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Submit")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct ResultSummaryRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.headline)
                .foregroundColor(.secondary)

            Spacer()

            Text(value)
                .font(.headline)
                .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    NavigationStack {
        SubmitResultView(foundCount: 7, rewardMessage: "20% Discount")
    }
}
