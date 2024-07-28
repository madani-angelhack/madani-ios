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
    @Published var itemsTokoKarya: [itemTokoKarya] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadPromoItems()
        loadCategories()
    }
    
    private func loadPromoItems() {
        
        if let url = URL(string: "https://personal-j15xifdf.outsystemscloud.com/ServiceMarketplace/rest/Marketplace/GetAllMarketItemList") {
            NetworkHelper.shared.fetchData(from: url, type: [itemTokoKarya].self).sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] dataModels in
                self?.itemsTokoKarya = dataModels
            })
            .store(in: &cancellables)
        }
        
        
        promoItems = [
            PromoItem(name: "Top Plastik", price: "Rp 135.000", image: "top_plastik", stock: 5),
            PromoItem(name: "Vas Bunga Kaca", price: "Rp 89.000", image: "vas_bunga", stock: 3),
            PromoItem(name: "Kotak Pensil", price: "Rp 25.000", image: "kotak_pensil", stock: 10)
        ]
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

