//
//  LoginViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Combine
import FirebaseAuth
import SwiftUI
class LoginViewModel: ObservableObject {
    @Published var userLogin = UserLogin(email: "", password: "", rememberMe: false)
    @Published var errorMessage: String?
    @Published var isLoginSuccessful: Bool = false
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    func login() {
        // Example validation logic
        guard !userLogin.email.isEmpty, !userLogin.password.isEmpty else {
            errorMessage = "Email and password are required."
            return
        }
        
        // Assume login is successful
        
        Auth.auth().signIn(withEmail: userLogin.email, password: userLogin.password) { authResult, error in
            
            if let error = error {
//                self.error = error
                self.isLoginSuccessful = false
            }else {
                self.isLoggedIn = true
//                print("Logging in with email: \(self.email) and password: \(self.password)")
                self.isLoginSuccessful = true
            }
        }
        
    }
}

