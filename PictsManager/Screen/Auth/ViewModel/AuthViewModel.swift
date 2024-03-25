//
//  LoginViewModel.swift
//  PictsManager
//
//  Created by Minh Duc on 06/03/2024.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var errorMessage: String? = ""
    
    /// Simple login with form
    func login(login: String, password: String, completion: @escaping (Bool) -> Void) async {
        guard let url = URL(string: Api.Auth.login) else {
            self.errorMessage = "Invalid URL for login endpoint"
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let loginForm = LoginForm(login: login, password: password)
 
        
        guard let jsonData = try? JSONEncoder().encode(loginForm) else {
            self.errorMessage = "Failed to encode user data"
            completion(false)
            return
        }
        
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                self.errorMessage = error?.localizedDescription
                completion(false)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let responseData = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                    UserSessionManager.shared.saveAuthToken(responseData.access_token)
                    completion(true)
                }
            } else {
                if let errorMessage = String(data: data, encoding: .utf8) {
                    self.errorMessage = errorMessage
                } else {
                    self.errorMessage = error?.localizedDescription
                }
                completion(false)
            }
        }.resume()
    }
    
    /// Login with token
    func loginWithToken(token: String) async throws {
        guard let url = URL(string: Api.Auth.loginWithToken) else {
            self.errorMessage = "Invalid URL for login endpoint"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try? JSONDecoder().decode(LoginResponse.self, from: data)
    }
    
    /// Registration with form
    func register(email: String, username: String, password: String) {
        guard let url = URL(string: Api.Auth.register) else {
            self.errorMessage = "Invalid URL for register endpoint"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let registerForm = RegisterForm(email: email, username: username, password: password)
 
        guard let jsonData = try? JSONEncoder().encode(registerForm) else {
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
                if let responseData = try? JSONDecoder().decode(User.self, from: data) {
                    UserSessionManager.shared.saveAuthToken(responseData.token)

                    print("responseData: ", responseData)
                    print("After UserSession", UserSessionManager.shared.isAuthenticated)
                } else {
                    if let errorMessage = String(data: data, encoding: .utf8) {
                        self.errorMessage = errorMessage
                    } else {
                        self.errorMessage = "Error"
                    }
                }
            }
        }.resume()
    }
    
    
    func logout() {
        UserSessionManager.shared.clearSession()
    }
}
