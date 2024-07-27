//
//  HomeModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation

// Model for Promo Item
struct PromoItem: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let price: String
    let image: String
    let stock: Int
}

// Model for Challenge
struct Challenge: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let participants: Int
    let image: String
    var point: Int = 0
}
