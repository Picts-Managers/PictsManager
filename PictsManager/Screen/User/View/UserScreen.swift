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
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Username")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                TextField("Username", text: /*$viewModel.user.username*/ $editableUsername)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .autocapitalization(.none)
                    .disabled(!isEditing)
                
        
                Text("Email")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                TextField("Email", text: /*$viewModel.user.email*/ $editableEmail)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .autocapitalization(.none)
                    .disabled(!isEditing)
                
                
                Text("Password")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                SecureField("Password", text: /*$viewModel.user.email*/ $editableEmail)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .textCase(.lowercase)
                    .disabled(!isEditing)
                
                Spacer()
            
                Button(action: {
                    
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
//                .navigationDestination(isPresented: $isLoggedIn) { Navbar().navigationBarBackButtonHidden(true) }
                
            }
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
            .navigationTitle("Hi, \(viewModel.user.username)")
            .onAppear {
                viewModel.fetchUser()
                editableUsername = viewModel.user.username
                editableEmail = viewModel.user.email
                
            }
        }
    }
}

struct UserScreen_Previews: PreviewProvider {
    static var previews: some View {
        let userViewModel = UserViewModel()
        UserScreen(viewModel: userViewModel)
    }
}
