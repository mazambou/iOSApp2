//
//  HuntItemData.swift
//  ScavengerHuntApp
//
//  Created by AZAMBOU Marcel on 2026-06-06.
//

import Foundation

struct HuntItemData {
   
    func loadHuntItemData() -> [HuntItem] {

        let url = Bundle.main.url(forResource: "huntItems",
                                  withExtension: "json")

        if url == nil {
            return []
        }else {
            do {
                let data = try Data(contentsOf: url!)
                let decoder = JSONDecoder()
                let huntItems: [HuntItem] = try decoder.decode([HuntItem].self, from: data)
                return huntItems
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }

        // Suite plus tard

        return []
    }
}
