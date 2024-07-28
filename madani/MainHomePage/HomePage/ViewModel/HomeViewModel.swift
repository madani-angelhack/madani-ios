//
//  HomeViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI
import FirebaseDatabase
import Combine

class HomeViewModel: ObservableObject {
    //    @Published var items: [DataModel] = []
    private var ref: DatabaseReference = Database.database().reference()
    private var cancellables = Set<AnyCancellable>()
    @Published var promoItems: [PromoItem] = []
    @Published var challenges: [Challenge] = []
    
    @Published var itemsSuhu: [Suhu] = []{
        didSet {
            syncItem()
        }
    }
    
    @Published var itemsDanger: [Suhu] = []
    
    @Published var items: [GridItemModel] = [
        GridItemModel(id: 1, title: "Waste Management", iconName: "cube.box"),
        GridItemModel(id: 2, title: "Daily Mission", iconName: "calendar"),
        GridItemModel(id: 3, title: "Marketplace", iconName: "doc.text"),
        GridItemModel(id: 4, title: "Event", iconName: "envelope")
    ]
    init() {
        loadPromoItems()
        loadChallenges()
        hitDisaster()
//        self.currentSuhu = currentSuhu
//        self.itemsSuhu = currentSuhu.decode([Suhu].self) ?? []
//        self._itemsSuhu = Published(initialValue: currentSuhu.decode([Suhu].self) ?? [])
    }
    
    func hitDisaster() {
        NetworkHelper.shared.fetchDataListen(from: "data", type: Suhu.self)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] dataModels in
                print(dataModels)
                self?.itemsSuhu = dataModels
            })
            .store(in: &cancellables)
        
        
    }
    func syncItem() {
        itemsDanger.removeAll()
        itemsSuhu.forEach { suhu in
            if suhu.sensor.is_danger {
                itemsDanger.append(Suhu(id: suhu.id, lon: suhu.lon, lat: suhu.lat, sensor: Sensor(humidity_data: suhu.sensor.humidity_data, temp_data: suhu.sensor.temp_data, is_danger: suhu.sensor.is_danger, gas: suhu.sensor.gas, flood: suhu.sensor.flood), radius: suhu.radius, relay: Relay(sirens: suhu.relay.sirens)))
            }
        }
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
