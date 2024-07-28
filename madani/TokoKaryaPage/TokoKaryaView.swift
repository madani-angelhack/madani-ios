//
//  TokoKaryaView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI

import SwiftUI

struct TokoKaryaView: View {
    @StateObject private var viewModel = TokoKaryaViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Search Bar
                    HStack {
                        TextField("Cari di Toko Karya...", text: $searchText)
                            .padding(.leading, 20)
                        Image(systemName: "magnifyingglass")
                            .padding(.trailing, 20)
                    }
                    .frame(height: 50)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    // Categories
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.categories) { category in
                                CategoryView(category: category)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Promo Banner
                    Image("promo_banner")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal)
                    
                    // Sales Section
                    SectionHeaderView(title: "12.12 Sales, buruan checkout!")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.itemsTokoKarya) { item in
                                PromoItemView(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Join Us Section
                    Image("join_us_banner")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal)
                    
                    // Recommendations
//                    SectionHeaderView(title: "Rekomendasi")
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(viewModel.promoItems) { item in
//                                PromoItemView(item: item)
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
                }
                .navigationTitle("Toko Karya")
            }
        }
    }
}

// Reusable components
struct CategoryView: View {
    let category: Category
    
    var body: some View {
        VStack {
            Image(category.image)
                .resizable()
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            Text(category.name)
                .font(.caption)
        }
        .padding()
    }
}

struct TokoKaryaView_Previews: PreviewProvider {
    static var previews: some View {
        TokoKaryaView()
            .previewDevice("iPhone 12")
    }
}
