//
//  EventDaftarView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//


import SwiftUI

struct EventDaftarView: View {
    @ObservedObject var viewModel = EventDaftarViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let url = URL(string: viewModel.event.imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 200)
                    .clipped()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.event.title)
                        .font(.title)
                        .bold()
                    
                    Text(viewModel.event.description)
                        .font(.body)
                        .foregroundColor(.primary)
                    
                    HStack {
                        Text("Alamat:")
                            .font(.headline)
                        Text(viewModel.event.address)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    
                    HStack {
                        Text("Jadwal:")
                            .font(.headline)
                        Text("\(viewModel.event.date) | \(viewModel.event.time)")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    
                    if let mapUrl = URL(string: viewModel.event.mapImageUrl) {
                        AsyncImage(url: mapUrl) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 200)
                        .clipped()
                    }
                }
                .padding()
                
                Button(action: {
                    // Action for button
                }) {
                    Text("Daftar Sekarang")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .navigationTitle("Detail Event")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct EventDaftarView_Previews: PreviewProvider {
    static var previews: some View {
        EventDaftarView()
    }
}
