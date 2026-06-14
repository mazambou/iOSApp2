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
            GeometryReader { geometry in
                VStack(spacing: 12) {
                    headerView
                    heroImageView(maxHeight: geometry.size.height * 0.26)
                    featureListView
                    startButton
                }
                .padding(.horizontal, 28)
                .padding(.top, 16)
                .padding(.bottom, 18)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            }
            .background(appBackground)
        }
    }

    private var appBackground: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 1.00, green: 0.97, blue: 0.90),
                Color(red: 0.98, green: 0.93, blue: 0.82)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    private var headerView: some View {
        VStack(spacing: 6) {
            Image("hunt01Img")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 132, maxHeight: 88)

            VStack(spacing: -4) {
                Text("SCAVENGER")
                    .font(.system(size: 40, weight: .black, design: .rounded))
                    .foregroundColor(Color(red: 0.04, green: 0.10, blue: 0.14))
                    .minimumScaleFactor(0.55)
                    .lineLimit(1)

                Text("HUNT")
                    .font(.system(size: 44, weight: .black, design: .rounded))
                    .foregroundColor(Color(red: 0.27, green: 0.47, blue: 0.23))
                    .minimumScaleFactor(0.55)
                    .lineLimit(1)
            }

            Text("Explore. Find. Earn Rewards!")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.04, green: 0.10, blue: 0.14))
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
    }

    private func heroImageView(maxHeight: CGFloat) -> some View {
        Image("hunt02Img")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .frame(height: max(150, min(maxHeight, 220)))
    }

    private var featureListView: some View {
        VStack(spacing: 0) {
            HomeFeatureRow(
                imageName: "findItemsImg",
                title: "Find Items",
                subtitle: "Track down all the hidden items."
            )

            Divider()
                .padding(.leading, 76)

            HomeFeatureRow(
                imageName: "takePhotosImg",
                title: "Mark Progress",
                subtitle: "Update each item when it is found."
            )

            Divider()
                .padding(.leading, 76)

            HomeFeatureRow(
                imageName: "getRewardsImg",
                title: "Get Rewards",
                subtitle: "Submit your results and earn rewards."
            )
        }
    }

    private var startButton: some View {
        NavigationLink {
            HuntListView(items: $items, foundCount: foundCount)
        } label: {
            HStack {
                Spacer()

                Text("Start Hunt")
                    .font(.title3)
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "arrow.right")
                    .font(.title3.weight(.bold))
            }
            .foregroundColor(.white)
            .padding(.vertical, 18)
            .padding(.horizontal, 24)
            .background(Color(red: 0.23, green: 0.45, blue: 0.20))
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .shadow(color: .black.opacity(0.16), radius: 10, x: 0, y: 6)
        }
    }
}

private struct HuntListView: View {
    @Binding var items: [HuntItem]
    let foundCount: Int

    var body: some View {
        List {
            Section {
                HStack {
                    Label("\(foundCount) of \(items.count) found", systemImage: "checkmark.circle.fill")
                        .font(.headline)
                        .foregroundColor(.green)

                    Spacer()

                    NavigationLink("Rewards") {
                        RewardView(items: items)
                    }
                    .font(.headline)
                }
                .padding(.vertical, 6)
            }

            Section("Items") {
                ForEach($items) { $item in
                    NavigationLink {
                        HuntItemDetailView(item: $item)
                    } label: {
                        HuntItemRowView(item: item)
                    }
                }
            }
        }
        .navigationTitle("Hunt List")
    }
}

private struct HomeFeatureRow: View {
    let imageName: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 16) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.04, green: 0.10, blue: 0.14))
                    .lineLimit(1)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(Color(red: 0.10, green: 0.14, blue: 0.18))
                    .lineLimit(2)
                    .minimumScaleFactor(0.85)
            }

            Spacer()
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    ContentView()
}
