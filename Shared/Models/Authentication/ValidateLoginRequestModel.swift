//
//  ValidateLoginRequestModel.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/05/21.
//

import Foundation

struct ValidateLoginRequestModel: ModelProtocol {
    let userName: String
    let password: String
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case userName = "username"
        case password
        case requestToken = "request_token"
    }
}
