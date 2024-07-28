//
//  LoginView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State var goToMainView = false
    var body: some View {
        NavigationView {
            VStack {
                // Header
                VStack {
                    Text("Selamat Datang")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 40)
                    
                    Text("Masuk Menggunakan Akun")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                }
                
                // Form Fields
                VStack(spacing: 20) {
                    CustomTextField(placeholder: "Masukkan Email Anda", text: $viewModel.userLogin.email, keyboardType: .emailAddress)
                    CustomSecureField(placeholder: "Masukkan Kata Sandi Anda", text: $viewModel.userLogin.password)
                }
                .padding(.horizontal, 40)
                
                // Remember Me and Forgot Password
                HStack {
                    Toggle("Ingat Saya", isOn: $viewModel.userLogin.rememberMe)
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    Button(action: {
                        // Handle forgot password
                    }) {
                        Text("Lupa Kata Sandi?")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal, 40)
                
                // Error Message
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.vertical, 10)
                }
                
                // Login Button
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Masuk")
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
                    Text("Tidak Mempunyai Akun?")
                        .foregroundColor(.gray)
                    Button(action: {
                        // Handle navigate to register
                    }) {
                        Text("Buat Akun")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.top, 20)
                
                Spacer()
            }.background(
                NavigationLink(
                    destination: MainHomeView(),
                    isActive: $goToMainView,
                    label: { EmptyView() }
                )
                .hidden())
            .onReceive(viewModel.$isLoginSuccessful) { isSuccessful in
                if isSuccessful {
                    self.goToMainView = true
                    // Handle successful login, e.g., navigate to another view
                }
            }
        }
        
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

