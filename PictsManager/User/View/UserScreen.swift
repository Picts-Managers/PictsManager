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
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Username: \(viewModel.user.username)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Text("Email \(viewModel.user.username)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Text("Email \(viewModel.user.username)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Spacer()
            }
            
            // for testing purpose only
            Button(action: {
                viewModel.fetchUser()
            }) {
                Text("Refresh User Data")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .navigationTitle("Hi, mynkie \(viewModel.user.username)")
            .onAppear {
                viewModel.fetchUser()
            }
        }
        .padding()
    }
    
    struct UserScreen_Previews: PreviewProvider {
        static var previews: some View {
            UserScreen(viewModel: UserViewModel())
        }
    }
}
