//
//  ProfileModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation

struct ProfileMenuItem: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
}

enum ProfileViewType {
    case main
    case editProfile
}
