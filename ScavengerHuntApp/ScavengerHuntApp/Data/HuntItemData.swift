//
//  HuntItemData.swift
//  ScavengerHuntApp
//
//  Created by AZAMBOU Marcel on 2026-06-06.
//

import Foundation

struct HuntItemData {
    func loadHuntItemData() -> [HuntItem] {
        guard let url = Bundle.main.url(forResource: "huntItems", withExtension: "json") else {
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([HuntItem].self, from: data)
        } catch {
            print("Error loading hunt items: \(error)")
            return []
        }
    }
}
