//
//  CustomNavigation.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation

import SwiftUI

struct CustomNavigationBar: View {
    var title: String
    var onBack: (() -> Void)?
    var onNotification: (() -> Void)?
    var onProfile: (() -> Void)?
    
    var body: some View {
        HStack {
            if let onBack = onBack {
                Button(action: {
                    onBack()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
            
            Text(title)
                .font(.headline)
                .bold()
            
            Spacer()
            
            if let onNotification = onNotification {
                Button(action: {
                    onNotification()
                }) {
                    Image(systemName: "bell")
                        .foregroundColor(.black)
                }
            }
            
            if let onProfile = onProfile {
                Button(action: {
                    onProfile()
                }) {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
