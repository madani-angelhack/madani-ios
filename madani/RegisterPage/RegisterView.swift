//
//  RegisterView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation
import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            // Header
            VStack {
                Text("Daftar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                Text("Membuat Akun Pengguna Baru")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
            }
            
            // Form Fields
            VStack(spacing: 20) {
                CustomTextField(placeholder: "Nama Lengkap", text: $viewModel.userRegistration.fullName)
                CustomTextField(placeholder: "E-mail", text: $viewModel.userRegistration.email, keyboardType: .emailAddress)
                CustomTextField(placeholder: "Nomor Telepon", text: $viewModel.userRegistration.phoneNumber, keyboardType: .phonePad)
                CustomSecureField(placeholder: "Kata Sandi", text: $viewModel.userRegistration.password)
            }
            .padding(.horizontal, 40)
            
            // Error Message
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.vertical, 10)
            }
            
            // Agreement Text
            Text("Dengan mendaftar, Anda setuju dengan Syarat & Ketentuan serta Aturan Privasi")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.vertical, 20)
            
            // Register Button
            Button(action: {
                viewModel.register()
            }) {
                Text("Daftar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
            
            // Or Divider
            HStack {
                Divider()
                Text("atau")
                    .foregroundColor(.gray)
                Divider()
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 40)
            
            // Social Login Buttons
            HStack(spacing: 20) {
                SocialLoginButton(imageName: "google", action: {
                    // Handle Google login
                })
                SocialLoginButton(imageName: "facebook", action: {
                    // Handle Facebook login
                })
                SocialLoginButton(imageName: "apple", action: {
                    // Handle Apple login
                })
            }
            
            // Already Have an Account Link
            HStack {
                Text("Sudah Mempunyai Akun?")
                    .foregroundColor(.gray)
                Button(action: {
                    // Handle navigate to login
                }) {
                    Text("Masuk")
                        .foregroundColor(.blue)
                }
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .onReceive(viewModel.$isRegistrationSuccessful) { isSuccessful in
            if isSuccessful {
                // Handle successful registration, e.g., navigate to another view
            }
        }
    }
}

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .keyboardType(keyboardType)
    }
}

struct CustomSecureField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        SecureField(placeholder, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

struct SocialLoginButton: View {
    var imageName: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(imageName)
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
