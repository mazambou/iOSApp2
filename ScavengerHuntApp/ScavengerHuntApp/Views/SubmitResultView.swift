//
//  SubmitResultView.swift
//  ScavengerHuntApp
//
//  Created by AZAMBOU Marcel on 2026-06-06.
//

import SwiftUI

struct SubmitResultView: View {
    let foundCount: Int
    @State private var didSubmit = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Submit Results")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Items found: \(foundCount)")
                .font(.title3)

            Button("Submit Results") {
                didSubmit = true
            }
            .buttonStyle(.borderedProminent)

            if didSubmit {
                Text("Results submitted successfully.")
                    .font(.headline)
                    .foregroundColor(.green)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Submit")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SubmitResultView(foundCount: 5)
    }
}
