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
                Text("PictsManager")
                    .font(.title)
                    .bold()
                
                TextField("Username", text: $username)
                    .padding(.horizontal, 20)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .padding(.horizontal, 20)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    Button(action: {
                        viewModel.login(login: username, password: password)
                        isLoggedIn = UserSessionManager.shared.isAuthenticated
                    }) {
                        Text("Login")
                            .font(.headline)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 7)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .navigationDestination(isPresented: $isLoggedIn) { HomeScreen().navigationBarBackButtonHidden(true) }
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    NavigationLink {
                        RegisterScreen()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Not an user yet? Register")
                            .font(.headline)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 7)
                            .foregroundColor(.blue)
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
