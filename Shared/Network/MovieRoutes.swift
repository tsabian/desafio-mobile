//
//  MovieRoutes.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import Alamofire

enum MovieRoutes: RouteProtocol {
    case getPopular(MoviesRequestModel)
    case getTopRated(MoviesRequestModel)
    
    var method: HTTPMethod {
        switch self {
        case .getPopular,
             .getTopRated:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getPopular:
            return "/movie/popular"
        case .getTopRated:
            return "/movie/top_rated"
        }
    }
    
    var baseURL: String {
        switch self {
        case .getPopular, .getTopRated:
            return EnvironmentKeys.hostURL.absoluteString
        }
    }

    var headers: HTTPHeaders {
        switch self {
        default:
            return HTTPHeaders()
        }
    }
    
    var queryParams: Parameters? {
        switch self {
        default:
            return Parameters(dictionaryLiteral: ("apikey", Environment.shared.get(plistKey: .apiKey)))
        }
    }
}
