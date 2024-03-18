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
        NavigationStack {
            VStack {
                Spacer()
                
                Text("PictsManager")
                    .font(.title)
                    .bold()
                
                
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
