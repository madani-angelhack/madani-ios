//
//  ZonaResikoView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI
import CoreLocation

struct ZonaResikoView: View {
    @State private var totalDistance: CLLocationDistance = 0.0
    
    @ObservedObject var viewModel: ZonaResikoViewModel
    
    var body: some View {
        VStack {
            // Display map view
            MapView(totalDistance: $totalDistance, selectedSuhu: $viewModel.selectedSuhu, markers: $viewModel.markers, dangers: $viewModel.dangers)
                .edgesIgnoringSafeArea(.all)
            
            // Display total distance
            Text("Total Distance: \(String(format: "%.2f", totalDistance)) meters")
                           .padding()
            VStack {
                Text("Selected Suhu: \($viewModel.selectedSuhu.id.wrappedValue)")
                               .padding()
                Button("Nyalakan Alarm") {
                    viewModel.updateData()
                }.disabled($viewModel.selectedSuhu.id.wrappedValue == "")
            }
            
        }
    }
}

#Preview {
    ZonaResikoView(viewModel: ZonaResikoViewModel(dangers: []))
}
