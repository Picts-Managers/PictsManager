//
//  AuthScreen.swift
//  PictsManager
//
//  Created by Minh Duc on 14/03/2024.
//

import Foundation
import SwiftUI

/// This screen is the entrypoint of the application 
struct AuthScreen: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Spacer()
                
                Text("PictsManager")
                    .font(.title)
                    .bold()
                                
                NavigationLink(destination: LoginScreen()) {
                    Text("Login")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                
                NavigationLink(destination: RegisterScreen()) {
                    Text("Register")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AuthScreen()
}
