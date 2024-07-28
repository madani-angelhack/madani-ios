//
//  Appdelegate.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation
import UIKit
import GoogleMaps
import UserNotifications
import Firebase

let APIKey = "AIzaSyBwXVHvfV-Lt-hzyz1ivKuqN7cYQyt7c9s"

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        
        GMSServices.provideAPIKey(APIKey)
        
        FirebaseApp.configure()
        
        return true
    }
    

}
