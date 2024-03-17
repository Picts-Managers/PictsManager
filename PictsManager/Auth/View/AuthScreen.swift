//
//  AuthScreen.swift
//  PictsManager
//
//  Created by Minh Duc on 14/03/2024.
//

import Foundation
import SwiftUI
import AuthenticationServices

/// This screen is the entrypoint of the application
struct AuthScreen: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Spacer()
                
                Text("PictsManager")
                    .font(.title)
                    .bold()
                
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes =  [.fullName, .email]
                } onCompletion: { result in
                    switch result {
                        case .success(let authResults):
//                            guard let credential = authResults.credential as? ASAuthorizationAppleIDCredential else { return }
//                            let fullName = credential.fullName
//                            let email = credential.email
                            print("Authorisation successful")
                        case .failure(let error):
                            print("Authorisation failed: \(error.localizedDescription)")
                    }
                }
                .frame(height: 50)
                .signInWithAppleButtonStyle(.whiteOutline)
                                
                NavigationLink(destination: LoginScreen()) {
                    Text("Login")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: RegisterScreen()) {
                    Text("Register")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AuthScreen()
}
