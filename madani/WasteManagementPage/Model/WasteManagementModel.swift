//
//  WasteManagementModel.swift
//  madani
//
//  Created by fakhry_fauzan on 28/07/24.
//

import Foundation
import SwiftUI

struct CatalogItem: Identifiable, Codable {
    let id: Int
    let wasteCategory, wasteName, remark: String
    let price: Int
    let unit, image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case wasteCategory = "WasteCategory"
        case wasteName = "WasteName"
        case remark = "Remark"
        case price = "Price"
        case unit = "Unit"
        case image = "Image"
    }
}

struct WMCategory: Codable {
    let wasteCategory: WasteCategory

    enum CodingKeys: String, CodingKey {
        case wasteCategory = "WasteCategory"
    }
}

// MARK: - WasteCategory
struct WasteCategory: Codable, Identifiable {
    let id: Int
    var label: String
    let order: Int
    let isActive: Bool

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case label = "Label"
        case order = "Order"
        case isActive = "Is_Active"
    }
}
