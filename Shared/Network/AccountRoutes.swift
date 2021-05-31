//
//  AccountRoutes.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/05/21.
//

import Alamofire

enum AccountRoutes: RouteProtocol {
    case getAccount(sessionID: String)
    
    var method: HTTPMethod {
        switch self {
        case .getAccount:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getAccount:
            return "/account"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return EnvironmentKeys.hostURL.absoluteString
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        default:
            return HTTPHeaders()
        }
    }
    
    var queryParams: Parameters {
        switch self {
        default:
            return Parameters(dictionaryLiteral: ("apikey", Environment.shared.get(plistKey: .apiKey)))
        }
    }
}
