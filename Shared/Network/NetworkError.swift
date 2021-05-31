//
//  NetworkError.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 13/01/21.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestError(error: Error)
}
