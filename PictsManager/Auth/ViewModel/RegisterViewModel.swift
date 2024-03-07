//
//  RegisterViewModel.swift
//  PictsManager
//
//  Created by Minh Duc on 07/03/2024.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    func register() {
        // TODO: Implement logic
    }
}
