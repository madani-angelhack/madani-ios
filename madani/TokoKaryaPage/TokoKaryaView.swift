//
//  TokoKaryaView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI

struct TokoKaryaView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Profile and balance
                    HStack {
                        Image("profile_image")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text("Hello")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Maudy")
                                .font(.title)
                                .fontWeight(.bold)
                            
                        }
                        Spacer()
                        VStack {
                            Text("Saldo M-Point")
                            Text(": 30.000")
                            
                        }
                        VStack {
                            Text("Sampah terjual")
                            Text(": 0 kg")
                        }
                        // Profile Image
                        
                    }
                    .padding()
                    
                    // Action buttons
                    HStack {
                        ActionButton(title: "Jual Sampah", iconName: "trash.fill")
                        ActionButton(title: "Misi Harian", iconName: "checkmark.circle.fill")
                        ActionButton(title: "Tukarkan Point", iconName: "gift.fill")
                    }
                    .padding()
                    
                    // Challenges
                    SectionHeaderView(title: "Challenge hari ini")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.challenges) { challenge in
                                ChallengeView(challenge: challenge)
                            }
                        }
                    }
                    
                    // Promo Items
                    SectionHeaderView(title: "Ada promo apa hari ini?")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.promoItems) { item in
                                PromoItemView(promoItem: item)
                            }
                        }
                    }
                }
                .navigationTitle("Toko Karya")
            }
        }
    }
}

#Preview {
    TokoKaryaView()
}
