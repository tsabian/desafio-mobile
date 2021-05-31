//
//  AuthhenticationRoutes.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/05/21.
//

import Alamofire

enum AuthenticationRoutes: RouteProtocol {
    case createGuestSession
    case createRequestToken
    case createSessionWithLogin(ValidateLoginRequestModel)
    case createSession(SessionRequestModel)
    case deleteSession(DeleteSessionRequestModel)
    
    var method: HTTPMethod {
        switch self {
        case .createGuestSession,
             .createRequestToken:
            return .get
        case .createSession,
             .createSessionWithLogin:
            return .post
        case .deleteSession:
            return .delete
        }
    }
    
    var path: String {
        switch self {
        case .createGuestSession:
            return "/authentication/guest_session/new"
        case .createRequestToken:
            return "/authentication/token/new"
        case .createSession:
            return "/authentication/session/new"
        case .createSessionWithLogin:
            return "/authentication/token/validate_with_login"
        case .deleteSession:
            return "/authentication/session"
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
