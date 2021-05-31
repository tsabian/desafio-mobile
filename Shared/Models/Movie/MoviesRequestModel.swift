//
//  MoviesRequestModel.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import Foundation

struct MoviesRequestModel: ModelProtocol {
    let language: String
    let page: Int
    let region: String
}
