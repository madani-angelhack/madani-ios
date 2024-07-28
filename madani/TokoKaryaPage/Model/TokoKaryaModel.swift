//
//  TokoKaryaModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

struct itemTokoKarya: Codable, Identifiable {
    let shopName, shopAddress, lastActive, category: String?
    let image, name, stock: String?
    let price: Int?
    let description: String?
    let isPromo, isRecommended: Bool?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case shopName = "ShopName"
        case shopAddress = "ShopAddress"
        case lastActive = "LastActive"
        case category = "Category"
        case image = "Image"
        case name = "Name"
        case stock = "Stock"
        case price = "Price"
        case description = "Description"
        case isPromo
        case isRecommended = "IsRecommended"
        case id
    }
}
