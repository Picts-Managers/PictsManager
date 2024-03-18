//
//  LoginScreen.swift
//  PictsManager
//
//  Created by Minh Duc on 06/03/2024.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var viewModel = AuthViewModel()
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                }
                .padding([.leading, .trailing], 20)
                    
                HStack {
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                }
                .padding([.leading, .trailing], 20)
                
                Button(action: {
                    Task {
                        await viewModel.login(login: username, password: password)
                        isLoggedIn = UserSessionManager.shared.isAuthenticated
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                .navigationDestination(isPresented: $isLoggedIn) { Navbar().navigationBarBackButtonHidden(true) }
                
                Spacer()
            }
        }
        .navigationTitle(isLoggedIn ? "" : "Login")
        .navigationBarBackButtonHidden(isLoggedIn)
    }
}

#Preview {
    LoginScreen()
}
