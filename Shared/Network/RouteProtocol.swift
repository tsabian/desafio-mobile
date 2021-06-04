//
//  RouteProtocol.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 30/05/21.
//

import Alamofire

protocol RouteProtocol: URLRequestConvertible {
    var path: String { get }
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var queryParams: Parameters? { get }
}

// MARK: - Route protocol extension
extension RouteProtocol {
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL) else {
            throw NetworkError.invalidURL
        }
        do {
            let urlRequest = try URLRequest(url: url.appendingPathComponent(path),
                                            method: method, headers: headers)
            return urlRequest
        } catch let requestError {
            throw NetworkError.requestError(error: requestError)
        }
    }
}
