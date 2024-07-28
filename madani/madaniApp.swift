//
//  madaniApp.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI
import GoogleMaps

@main
struct madaniApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainHomeView()
            }else {
                LoginView()
                
            }
        }
    }
}
