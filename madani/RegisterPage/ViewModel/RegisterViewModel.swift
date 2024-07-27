//
//  RegisterViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation

import Combine

class RegistrationViewModel: ObservableObject {
    @Published var userRegistration = UserRegistration(fullName: "", email: "", phoneNumber: "", password: "")
    @Published var errorMessage: String?
    @Published var isRegistrationSuccessful: Bool = false

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
        isRegistrationSuccessful = true
    }
}

