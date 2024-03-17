//
//  UserScreen.swift
//  PictsManager
//
//  Created by Minh Duc on 16/03/2024.
//

import Foundation
import SwiftUI

struct UserScreen: View {
    
//    let user: User
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Username")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Text("Email")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Text("Email")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Spacer()
            }
        }
        .padding()
        .navigationTitle("hihihi")
    }
}

#Preview {
    UserScreen()
}
