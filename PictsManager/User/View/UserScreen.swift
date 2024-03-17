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
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Username")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                TextField("Username", text: $viewModel.user.username)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .textCase(.lowercase)
                    .disabled(!isEditing)
                
        
                Text("Email")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                TextField("Email", text: $viewModel.user.email)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .textCase(.lowercase)
                    .disabled(!isEditing)
                
                Spacer()
            }
            .padding()
            .navigationBarItems(trailing: VStack {
                Button(action: {
                    isEditing.toggle()
                }) {
                    Text(isEditing ? "Done" : "Edit")
                }
            }
            )
            .navigationTitle("Hi, \(viewModel.user.username)")
            .onAppear {
                viewModel.fetchUser()
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
