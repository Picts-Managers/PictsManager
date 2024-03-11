//
//  LoginScreen.swift
//  PictsManager
//
//  Created by Minh Duc on 06/03/2024.
//

import SwiftUI

struct LoginScreen: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
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
                    // TODO: Navigate to Register screen
                }) {
                    Text("Not an user yet? Register")
                        .font(.headline)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 7)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Button(action: {
                    viewModel.login(login: username, password: password)
                }) {
                    Text("Login")
                        .font(.headline)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 7)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
            }
        }
        .padding()
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        LoginScreen(viewModel: viewModel)
    }
}
