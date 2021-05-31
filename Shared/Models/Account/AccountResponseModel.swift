//
//  AccountResponseModel.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/05/21.
//

import Foundation

struct AccountResponseModel: ModelProtocol {
    let avatar: Avatar
    let accountID: Int
    let iso6391, iso31661, name: String
    let includeAdult: Bool
    let username: String

    enum CodingKeys: String, CodingKey {
        case accountID = "id"
        case avatar
        case iso6391 = "iso_639_1"
        case iso31661 = "iso_3166_1"
        case name
        case includeAdult = "include_adult"
        case username
    }
}

struct Avatar: ModelProtocol {
    let gravatar: Gravatar
    let tmdb: Tmdb
}

struct Gravatar: ModelProtocol {
    let hash: String
}

struct Tmdb: ModelProtocol {
    let avatarPath: String

    enum CodingKeys: String, CodingKey {
        case avatarPath = "avatar_path"
    }
}
