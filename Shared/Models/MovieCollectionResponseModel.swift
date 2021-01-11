//
//  MovieCollectionResponseModel.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import Foundation

struct MovieCollectionResponseModel: ModelProtocol {
    
    let page: Int
    let results: [MovieResponseModel]
    let dates: DatesResponseModel?
    let totalResults, totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page, results, dates
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
