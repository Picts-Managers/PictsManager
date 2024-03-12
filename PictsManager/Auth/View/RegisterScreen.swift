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
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Register")
                    .font(.title)
                    .bold()
                
                TextField("Email", text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Username", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    viewModel.register(email: email, username: username, password: password)
                }) {
                    Text("Register")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
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
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        RegisterScreen(viewModel: viewModel)
    }
}
