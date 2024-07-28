//
//  WasteManagementView.swift
//  madani
//
//  Created by fakhry_fauzan on 28/07/24.
//

import Foundation
import SwiftUI

struct WasteManagementView: View {
//    let items: [CatalogItem]
    @StateObject private var viewModel = WasteManagementViewModel()
    @State private var selectedCategory = ""
    
    
    var filteredItems: [CatalogItem] {
        viewModel.items.filter { $0.wasteCategory == selectedCategory }
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Category selector
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach($viewModel.categories) { category in
//                            category
                            Button(action: {
                                selectedCategory = category.label.wrappedValue
                            }) {
                                Text(category.label.wrappedValue)
                                    .padding()
                                    .background(selectedCategory == category.label.wrappedValue ? Color.blue : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
                
                // Catalog items
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(filteredItems) { item in
                        CatalogItemView(item: item)
                    }
                }
                
                Spacer()
                .navigationTitle("Katalog Sampah")
            }
        }
    }
}

struct CatalogItemView: View {
    let item: CatalogItem
    
    var body: some View {
        VStack {
            HStack {
                if let data = Data(base64Encoded: item.image, options: .ignoreUnknownCharacters), let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                    
                }
                
                VStack(alignment: .leading) {
                    Text(item.wasteName)
                        .font(.headline)
                    Text(item.unit)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(String(item.price))
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 2)
            
            Button(action: {
                // Add to cart action
            }) {
                Image(systemName: "plus.circle")
                    .foregroundColor(.blue)
                    .font(.title)
            }
        }
    }
}
