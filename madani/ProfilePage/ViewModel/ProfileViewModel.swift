//
//  ProfileViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var username: String = "Maudya"
    @Published var email: String = "maudya@gmail.com"
    @Published var menuItems: [ProfileMenuItem] = []
    
    init() {
        loadMenuItems()
    }
    
    private func loadMenuItems() {
        menuItems = [
            ProfileMenuItem(title: "Edit Profil", iconName: "pencil.circle.fill"),
            ProfileMenuItem(title: "Bantuan", iconName: "questionmark.circle.fill"),
            ProfileMenuItem(title: "Tentang Kami", iconName: "info.circle.fill"),
            ProfileMenuItem(title: "Keluar", iconName: "arrow.right.circle.fill")
        ]
    }
}

