//
//  RegisterViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation

import Combine
import FirebaseAuth
import SwiftUI
class RegistrationViewModel: ObservableObject {
    @Published var userRegistration = UserRegistration(fullName: "", email: "", phoneNumber: "", password: "")
    @Published var errorMessage: String?
    @Published var isRegistrationSuccessful: Bool = false
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    func register() {
        // Example validation logic
        guard !userRegistration.fullName.isEmpty,
              !userRegistration.email.isEmpty,
              !userRegistration.phoneNumber.isEmpty,
              !userRegistration.password.isEmpty else {
            errorMessage = "All fields are required."
            return
        }
        
        // Assume registration is successful
        Auth.auth().createUser(withEmail: userRegistration.email, password: userRegistration.password) { authResult, error in
            if let error = error {
                print("Error registering user: \(error.localizedDescription)")
                self.isRegistrationSuccessful = false
            } else {
                print("User registered successfully")
                self.isLoggedIn = true
                self.isRegistrationSuccessful = true
            }
        }
        
        isRegistrationSuccessful = true
    }
}

