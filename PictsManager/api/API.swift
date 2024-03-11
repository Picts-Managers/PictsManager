//
//  APIEndpoints.swift
//  PictsManager
//
//  Created by Minh Duc on 11/03/2024.
//

import Foundation

struct API {
    static let baseURL = "http://127.0.0.1/"

    static func endpoint(path: String) -> String {
        return baseURL + path
    }
    
    static let login = endpoint(path: "login")
    static let register = endpoint(path: "register")
}
