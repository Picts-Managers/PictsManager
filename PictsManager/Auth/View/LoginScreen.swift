//
//  LoginScreen.swift
//  PictsManager
//
//  Created by Minh Duc on 06/03/2024.
//

import SwiftUI

struct LoginScreen: View {
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            TextField("Username", text: $loginViewModel.username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $loginViewModel.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: { loginViewModel.login() }) {
                Text("Login")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        let loginViewModel = LoginViewModel()
        LoginScreen(loginViewModel: loginViewModel)
    }
}
