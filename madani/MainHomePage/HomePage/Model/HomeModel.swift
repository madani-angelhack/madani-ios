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

struct GridItemModel: Identifiable {
    let id: Int
    let title: String
    let iconName: String
}

struct Sensor: Codable {
    var humidity_data: Double
    var temp_data: Double
    var is_danger: Bool
    var gas: Int
    var flood: String
}

struct Suhu: Codable {
    var id: String
    var lon: Double
    var lat: Double
    var sensor: Sensor
    var radius: Double?
    var relay: Relay
}

struct Relay: Codable {
    let sirens: String
}
