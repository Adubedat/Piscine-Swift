//
//  LoginService.swift
//  D04
//
//  Created by Arthur DUBEDAT on 3/31/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import Foundation

struct TokenResponse: Decodable {
    let tokenType: String
    let token : String
    private enum CodingKeys: String, CodingKey {
        case token = "access_token"
        case tokenType = "token_type"
    }
}

class LoginService {
    
    static let shared = LoginService()
    private let tokenUrl = "https://api.twitter.com/oauth2/token"
    private let bearer = ((API_UID + ":" + API_SECRET).data(using: String.Encoding.utf8)?.base64EncodedString())
    private let contentType = "application/x-www-form-urlencoded;charset=UTF-8"
    private let body = "grant_type=client_credentials"
    private var authorisation : String?
    var token : String?
    
    func login() {
        authorisation = "Basic " + bearer!
        getToken()
    }
    
    private func getToken() {
        
        guard let url = URL(string: tokenUrl) else { return }
        var request = URLRequest(url: url)
        request.setValue(authorisation, forHTTPHeaderField: "Authorization")
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let e = error {
                print(e)
            }
           
            if let result = try? JSONDecoder().decode(TokenResponse.self, from: data!) {
                self.token = result.token
            }

        }.resume()
    }
}
