//
//  TokoKaryaViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI
import Combine

class TokoKaryaViewModel: ObservableObject {
    @Published var promoItems: [PromoItem] = []
    @Published var categories: [Category] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadPromoItems()
        loadCategories()
    }
    
    private func loadPromoItems() {
        
        promoItems = [
            PromoItem(name: "Top Plastik", price: "Rp 135.000", image: "top_plastik", stock: 5),
            PromoItem(name: "Vas Bunga Kaca", price: "Rp 89.000", image: "vas_bunga", stock: 3),
            PromoItem(name: "Kotak Pensil", price: "Rp 25.000", image: "kotak_pensil", stock: 10)
        ]
//        guard let url = URL(string: "https://api.example.com/promos") else { return }
//        
//        NetworkHelper.shared.fetchData(from: url, type: [PromoItem].self)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .failure(let error):
//                    print("Failed to fetch promo items: \(error)")
//                case .finished:
//                    break
//                }
//            }, receiveValue: { [weak self] promoItems in
//                self?.promoItems = promoItems
//            })
//            .store(in: &cancellables)
    }
    
    private func loadCategories() {
        // Mock data for categories
        categories = [
            Category(name: "Kerajinan", image: "kerajinan"),
            Category(name: "Barang Harian", image: "barang_harian"),
            Category(name: "Hiasan", image: "hiasan"),
            Category(name: "Pakaian", image: "pakaian")
        ]
    }
}

