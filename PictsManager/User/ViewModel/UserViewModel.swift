//
//  UserViewModel.swift
//  PictsManager
//
//  Created by Minh Duc on 16/03/2024.
//

import Foundation


class UserViewModel: ObservableObject {
    @Published var user: User

    init(user: User) {
        self.user = user
    }
    
    
}


