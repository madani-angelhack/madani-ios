//
//  MainHomeView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation
import SwiftUI

struct MainHomeView: View {
//    @AppStorage("pasienID") var pasienID: String = ""
    
    var body: some View {
        TabView {
            // Home Tab
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            // Cleft Tracker Tab
            TokoKaryaView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Cleft Tracker")
                }
            
            // Messages Tab
            EdukasiView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Messages")
                }
            
            // Profile Tab
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }.navigationBarHidden(true)
    }
}

#Preview {
    MainHomeView()
}
