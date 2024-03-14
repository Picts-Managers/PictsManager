//
//  RegisterScreen.swift
//  PictsManager
//
//  Created by Minh Duc on 11/03/2024.
//

import Foundation
import SwiftUI

struct RegisterScreen: View {
    @StateObject var viewModel = AuthViewModel()
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isAccountCreated = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Register")
                    .font(.title)
                    .bold()
                
                TextField("Email", text: $email)
                    .padding(.horizontal, 20)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Username", text: $username)
                    .padding(.horizontal, 20)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .padding(.horizontal, 20)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    Button(action: {
                        viewModel.register(email: email, username: username, password: password)
                        isAccountCreated = UserSessionManager.shared.isAuthenticated
                    }) {
                        Text("Register")
                            .font(.headline)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 7)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .navigationDestination(isPresented: $isAccountCreated) { HomeScreen().navigationBarBackButtonHidden(true) }
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    NavigationLink {
                        LoginScreen()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Already have an account")
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

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        RegisterScreen(viewModel: viewModel)
    }
}
