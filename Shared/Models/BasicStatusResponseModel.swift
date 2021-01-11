//
//  BasicStatusResponseModel.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import Foundation

struct BasicStatusResponseModel: ModelProtocol {
    let statusCode: Int
    let statusMessage: String

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
