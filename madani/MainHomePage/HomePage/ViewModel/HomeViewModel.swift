//
//  HomeViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var promoItems: [PromoItem] = []
    @Published var challenges: [Challenge] = []
    
    init() {
        loadPromoItems()
        loadChallenges()
    }
    
    private func loadPromoItems() {
        // Mock data
        promoItems = [
            PromoItem(name: "Top Plastik", price: "Rp 135.000", image: "top_plastik", stock: 5),
            PromoItem(name: "Vas Bunga Kaca", price: "Rp 89.000", image: "vas_bunga", stock: 3),
            PromoItem(name: "Kotak Pensil", price: "Rp 25.000", image: "kotak_pensil", stock: 10)
        ]
    }
    
    private func loadChallenges() {
        // Mock data
        challenges = [
            Challenge(title: "Jual 5 kg Sampah", description: "50 kg", participants: 38, image: "ilus1"),
            Challenge(title: "Melakukan Recycle", description: "1x", participants: 40, image: "ilus2")
        ]
    }
}
