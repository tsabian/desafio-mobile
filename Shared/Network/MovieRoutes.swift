//
//  MovieRoutes.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import Alamofire

enum MovieRoutes: URLRequestConvertible {
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

    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL) else {
            throw NetworkError.invalidURL
        }
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
