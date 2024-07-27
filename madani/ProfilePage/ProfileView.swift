//
//  ProfileView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    @State private var activeView: ProfileViewType = .main
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                // Profile Header
                VStack {
                    Image("profile_picture")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 5)
                        .padding(.top, 20)
                    
                    Text(viewModel.username)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(viewModel.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                
                Divider()
                switch activeView {
                case .main:
                    List(viewModel.menuItems) { item in
                        HStack {
                            Image(systemName: item.iconName)
                                .font(.title2)
                                .foregroundColor(.blue)
                            Text(item.title)
                                .font(.headline)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 10)
                    }
                    .listStyle(PlainListStyle())
                case .editProfile:
                    EditProfileView()
                        .transition(.move(edge: .trailing))
                }
                
            }
            .navigationTitle("Profil")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .previewDevice("iPhone 12")
    }
}

