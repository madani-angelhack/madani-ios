//
//  EventView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation
import SwiftUI



struct EventView: View {
    var body: some View {
        VStack {
            // Header
            HStack {
                Button(action: {
                    // Action for back button
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
                .padding(.leading, 10)
                
                Spacer()
                
                Text("Event Lingkungan")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "bell")
                    .foregroundColor(.black)
                    .padding(.trailing, 10)
            }
            .padding(.vertical, 10)
            
            // Location
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.blue)
                Text("JL Yos Sudarso, No. 3, Kecamatan Rumbai")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
            
            // Event List
            List {
                EventRowView(imageName: "event1", title: "Kegiatan membersihkan Sungai Siak", date: "Kamis, 28 Desember 2023", participants: "20/30 partisipan")
                EventRowView(imageName: "event2", title: "Kegiatan Sosialisasi sampah di Rumbai", date: "Sabtu, 30 Desember 2023", participants: "Terbuka untuk umum")
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Event Lingkungan")
    }
}

struct EventRowView: View {
    let imageName: String
    let title: String
    let date: String
    let participants: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                
                Text(date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(participants)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top, 1)
            }
        }
        .padding(.vertical, 8)
    }
}


struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
