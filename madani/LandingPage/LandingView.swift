//
//  LandingView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation
//
import SwiftUI

struct LandingPageView: View {
    @StateObject private var viewModel = LandingViewModel()
    private let totalPages = 3

    var body: some View {
        VStack {
            TabView(selection: $viewModel.currentPage) {
                ForEach(0..<totalPages) { index in
                    LandingPageContentView(pageIndex: index)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 500) // Adjust based on your content size
            
            // Custom Page Indicator
            HStack(spacing: 8) {
                ForEach(0..<totalPages) { index in
                    if index == viewModel.currentPage {
                        Capsule()
                            .fill(Color.blue)
                            .frame(width: 20, height: 10)
                    } else {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 10, height: 10)
                    }
                }
            }.padding(.top, 20)
            
            if viewModel.currentPage == 2 {
                Button("Mulai Beraksi") {
                    
                }
            }
            
            
            
            Spacer()
        }
    }
}

struct LandingPageContentView: View {
    var pageIndex: Int

    var body: some View {
        VStack {
            // Replace with your actual image name
            Image("landing_illustration")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
                .padding(.top, 40)
            
            Text("Selamat Datang di Molen")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Text("""
                Molen merupakan aplikasi yang dikembangkan dengan tujuan untuk menyediakan Layanan Bank Sampah. Molen dilatar belakangi oleh keinginan untuk mengatasi permasalahan sampah yang ada di Indonesia.
                """)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            
            Spacer()
        }
        .tag(pageIndex)
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
