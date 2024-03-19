//
//  UserViewModel.swift
//  PictsManager
//
//  Created by Minh Duc on 16/03/2024.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var user: User = User(_id: "123", email: "mail@mail.com", username: "mynkie", token: "1234")
    @Published var errorMessage: String? = ""

    init() {}
    
    func fetchUser() {
        guard let url = URL(string: Api.Auth.me) else {
            self.errorMessage = "Invalid URL for user/me endpoint"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(user.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                self.errorMessage = error?.localizedDescription ?? "Unknown error"
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let decodedUser = try? JSONDecoder().decode(User.self, from: data) {
                    DispatchQueue.main.async {
                        self.user = decodedUser
                    }
                } else {
                    self.errorMessage = "Failed to decode user data"
                }
            } else {
                self.errorMessage = "Failed to fetch user data"
            }
        }.resume()
    }
}


