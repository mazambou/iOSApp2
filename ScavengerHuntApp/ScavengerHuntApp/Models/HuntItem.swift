//
//  HuntItem.swift
//  ScavengerHuntApp
//
//  Created by AZAMBOU Marcel on 2026-06-06.
//

import Foundation

struct HuntItem: Identifiable, Codable {
    var id = UUID()

    let name: String
    let businessName: String
    let imageName: String
    let clue: String
    var isFound: Bool = false

    enum CodingKeys: String, CodingKey {
        case name
        case businessName
        case imageName
        case clue
        case isFound
    }
}
extension HuntItem {
    static let preview = HuntItem(
        name: "Golden Coffee Cup",
        businessName: "Coffee House",
        imageName: "goldenCoffeeCupImg",
        clue: "Look near the coffee machine"
    )
}

