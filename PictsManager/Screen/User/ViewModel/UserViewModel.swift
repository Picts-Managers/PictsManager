//
//  UserViewModel.swift
//  PictsManager
//
//  Created by Minh Duc on 16/03/2024.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var userRepsonse: UserResponse?
    @Published var errorMessage: String? = ""
    
    func fetchUser() async {
        print(Api.Auth.me)
        guard let url = URL(string: Api.Auth.me) else {
            self.errorMessage = "Invalid URL for users/me endpoint"
            return
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        if let token = UserSessionManager.shared.getToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        } else {
            self.errorMessage = "User not authenticated"
            return
        }
        
//        do {
//            let (data, _) = try await URLSession.shared.data(for: request)
//
//            if let decodedUser = try? JSONDecoder().decode(UserResponse.self, from: data) {
//                DispatchQueue.main.async {
//                    self.userRepsonse = decodedUser
//                    self.user = User(_id: decodedUser._id, email: decodedUser.email, username: decodedUser.username, token: UserSessionManager.shared.getToken() ?? "")
//                    print("userResponse: ", self.userRepsonse)
//                    print("decodedUser: ", decodedUser)
//                    print("user: ", self.user)
//                }
//            } else {
//                self.errorMessage = "Failed to decode user data"
//            }
//        } catch {
//            DispatchQueue.main.async {
//                self.errorMessage = error.localizedDescription
//            }
//        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                self.errorMessage = error?.localizedDescription ?? "Unknown error"
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let decodedUser = try? JSONDecoder().decode(UserResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.user = User(_id: decodedUser._id, email: decodedUser.email, username: decodedUser.username, token: UserSessionManager.shared.getToken() ?? "")
                        print("user: ", self.user)
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
        
