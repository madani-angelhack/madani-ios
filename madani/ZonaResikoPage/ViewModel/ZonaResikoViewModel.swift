//
//  ZonaResikoViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI

class ZonaResikoViewModel: ObservableObject {
    @Published var markers: [MapMarker] = [MapMarker(title: "Kantor Polisi", deskripsi: "Kantor Polisi Terdekat", icon: "police", latitude: -6.290085635330602, longitude: 106.781942303036)]
    
    @Published var dangers: [Danger] = [Danger(title: "Banjir", latitude: -6.290865454283588, longitude: 106.79059706526344, typeDanger: .critical), Danger(title: "Banjir", latitude: -6.290908111267437, longitude: 106.78767882198515, typeDanger: .medium)]
}
