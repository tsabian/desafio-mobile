//
//  TokenResponseModel.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/05/21.
//

import Foundation

struct TokenResponseModel: ModelProtocol {
    let success: Bool
    let expiresAt: Date
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
