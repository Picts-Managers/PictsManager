//
//  UserScreen.swift
//  PictsManager
//
//  Created by Minh Duc on 16/03/2024.
//

import Foundation
import SwiftUI

struct UserScreen: View {
    
    @StateObject var viewModel: UserViewModel
    @State private var isEditing = false
    @State private var editableUsername: String = ""
    @State private var editableEmail: String = ""
    @State private var isLoggedIn = false
    @State private var isUserLoaded = false
    @EnvironmentObject private var toastManager: ToastManager

    var body: some View {
        NavigationView {
//            ScreenLinearColor(gradientTopColor: Color.red)
            
            VStack {
                
                Spacer()
        
                TextField("Username", text: /*$viewModel.user.username*/ $editableUsername)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .autocapitalization(.none)
                    .disabled(!isEditing)
                
                TextField("Email", text: /*$viewModel.user.email*/ $editableEmail)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .autocapitalization(.none)
                    .disabled(!isEditing)
                
                SecureField("Password", text: /*$viewModel.user.email*/ $editableEmail)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .textCase(.lowercase)
                    .disabled(!isEditing)
                
                Button(action: {
                    isLoggedIn = UserSessionManager.shared.isAuthenticated
                    print(isLoggedIn)
                    toastManager.toast = Toast(style: .info, message: "Logout")
                }) {
                    Text("Logout")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .navigationDestination(isPresented: $isLoggedIn) { AuthScreen().navigationBarBackButtonHidden(true) }
                
            }
            .toastView(toast: $toastManager.toast)
            .padding()
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        isEditing.toggle()
                    }) {
                        Text(isEditing ? "Done" : "Edit")
                    }
                }
            }
            .onReceive(viewModel.$user) { user in
                if let user = user {
                    editableUsername = user.username
                    editableEmail = user.email
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchUser()
                }
            }
            .navigationTitle(isUserLoaded ? "Hi2,  \(editableUsername)" : "Loading...")
        }
        .navigationTitle("Hi, \(editableUsername)")
    }
}

struct UserScreen_Previews: PreviewProvider {
    static var previews: some View {
        let userViewModel = UserViewModel()
        let toastManager = ToastManager()
        UserScreen(viewModel: userViewModel).environmentObject(toastManager)
    }
}
