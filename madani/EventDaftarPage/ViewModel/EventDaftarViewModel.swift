//
//  EventDaftarViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation

import Combine

class EventDaftarViewModel: ObservableObject {
    @Published var event: EventDaftarModel
    
    init() {
        // Dummy data for demonstration
        self.event = EventDaftarModel(
            title: "Kegiatan membersihkan Sungai Siak",
            description: "Merupakan kegiatan yang diselenggarakan RT/RW setempat untuk membersihkan Sungai Siak, spesifiknya di bawah Jembatan Leighton 3.",
            address: "Sungai Siak di bawah Jembatan Leighton 3",
            date: "Kamis, 28 Desember 2023",
            time: "14:00",
            imageUrl: "https://cdn-assetd.kompas.id/I9vtN7W2PO42puG0iZkcEIwlgEU=/1024x506/https%3A%2F%2Fasset.kgnewsroom.com%2Fphoto%2Fpre%2F2021%2F06%2F07%2Fc62ba444-c3ba-45b3-b03a-d900a2fe21c2_jpg.jpg", // URL of the event image
            mapImageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQby7rbDJ4pAE1PrBShAEyZxH_NzX7zj94O0w&s" // URL of the map image
        )
    }
}
