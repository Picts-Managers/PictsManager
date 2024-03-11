//
//  LoginViewModel.swift
//  PictsManager
//
//  Created by Minh Duc on 06/03/2024.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var isAuthenticated = false
    @Published var errorMessage = ""
    
    func login(user: User) {
        guard let url = URL(string: API.login) else {
            self.errorMessage = "Invalid URL for login endpoint"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let jsonData = try? JSONEncoder().encode(user) else {
            self.errorMessage = "Failed to encode user data"
            return
        }
        
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                self.errorMessage = "Error"
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                self.isAuthenticated = true
                
                if let responseBody = String(data: data, encoding: .utf8) {
                    print("Response body: ", responseBody)
                } else {
                    print("Response body decoding failed")
                }
            } else {
                if let errorMessage = String(data: data, encoding: .utf8) {
                    self.errorMessage = errorMessage
                } else {
                    self.errorMessage = "Error"
                }
            }
        }.resume()
    }
    
    func register() {
        // TODO: implement registration logic
    }
}
