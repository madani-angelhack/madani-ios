//
//  HomeView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation
import SwiftUI


import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Profile and balance
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hello, Maudya!")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Saldo M-Point: 30.000")
                            Text("Sampah terjual: 0 kg")
                        }
                        Spacer()
                        // Profile Image
                        Image("profile_image")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
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
                    ForEach(viewModel.challenges) { challenge in
                        ChallengeView(challenge: challenge)
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
                .navigationTitle("Dashboard")
            }
        }
    }
}

// Reusable components
struct ActionButton: View {
    let title: String
    let iconName: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text(title)
                .font(.headline)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .padding([.top, .leading])
    }
}

struct ChallengeView: View {
    let challenge: Challenge
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(challenge.title)
                .font(.headline)
            Text(challenge.description)
                .font(.subheadline)
            Text("\(challenge.participants) participants")
                .font(.caption)
        }
        .padding()
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct PromoItemView: View {
    let promoItem: PromoItem
    
    var body: some View {
        VStack {
            Image(promoItem.image)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            Text(promoItem.name)
                .font(.headline)
            Text(promoItem.price)
                .font(.subheadline)
            Text("Stock: \(promoItem.stock)")
                .font(.caption)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
