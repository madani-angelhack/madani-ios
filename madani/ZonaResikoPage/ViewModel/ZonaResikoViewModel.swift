//
//  ZonaResikoViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI
import FirebaseDatabase
import Combine
class ZonaResikoViewModel: ObservableObject {
    @Published var markers: [MapMarker] = [MapMarker(title: "Kantor Polisi", deskripsi: "Kantor Polisi Terdekat", icon: "police", latitude: -6.290085635330602, longitude: 106.781942303036)]
    
    
    private var ref: DatabaseReference = Database.database().reference()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var selectedSuhu: Suhu = Suhu(id: "", lon: 0, lat: 0, sensor: Sensor(humidity_data: 0, temp_data: 0, is_danger: false, gas: 0, flood: ""), radius: 0, relay: Relay(sirens: ""))
    @Published var dangers: [Suhu]
    
    init(dangers: [Suhu]) {
        self.dangers = dangers
    }
    
    func updateData() {
        let query = [
            [
                "id": selectedSuhu.id,
                "lat": selectedSuhu.lat,
                "lon": selectedSuhu.lon,
                "relay": [
                    "sirens": selectedSuhu.relay.sirens == "OFF" ? "ON" : "OFF"
                ],
                "sensor": [
                  "flood": selectedSuhu.sensor.flood,
                  "gas": selectedSuhu.sensor.gas,
                  "humidity_data": selectedSuhu.sensor.humidity_data,
                  "is_danger": selectedSuhu.sensor.is_danger,
                  "temp_data": selectedSuhu.sensor.temp_data
                ]
              ]
            
        ] as [[String:Any]]
        ref.child("data").setValue(query) { error, _ in
            if let error = error {
                print("Error updating data: \(error.localizedDescription)")
            } else {
                print("Data updated successfully")
            }
        }
    }
}
