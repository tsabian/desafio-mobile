//
//  AuthenticationService.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 03/06/21.
//

import Foundation

protocol AuthenticationServiceProtocol {
    typealias AuthenticationCompletion<T: ModelProtocol> = (T?, BasicStatusResponseModel?) -> Void

    func getGuestSession(completion: @escaping AuthenticationCompletion<TokenResponseModel>)
    func getSession(completion: @escaping AuthenticationCompletion<TokenResponseModel>)
    func validate(with login: ValidateLoginRequestModel, completion: @escaping AuthenticationCompletion<TokenResponseModel>)
    func createSession(with token: SessionRequestModel, completion: @escaping AuthenticationCompletion<SessionResponseModel>)
    func deleteSession(with token: DeleteSessionRequestModel, completion: @escaping AuthenticationCompletion<DeleteSessionResponseModel>)
}

final class AuthenticationService: BaseService, AuthenticationServiceProtocol {
    func getGuestSession(completion: @escaping AuthenticationCompletion<TokenResponseModel>) {
        performRequest(AuthenticationRoutes.createGuestSession, .global(), completion)
    }
    func getSession(completion: @escaping AuthenticationCompletion<TokenResponseModel>) {
        performRequest(AuthenticationRoutes.createRequestToken, .global(), completion)
    }
    func validate(with login: ValidateLoginRequestModel, completion: @escaping AuthenticationCompletion<TokenResponseModel>) {
        performRequest(AuthenticationRoutes.validateWithLogin(login), .global(), completion)
    }
    func createSession(with token: SessionRequestModel, completion: @escaping AuthenticationCompletion<SessionResponseModel>) {
        performRequest(AuthenticationRoutes.createSession(token), .global(), completion)
    }
    func deleteSession(with token: DeleteSessionRequestModel, completion: @escaping AuthenticationCompletion<DeleteSessionResponseModel>) {
        performRequest(AuthenticationRoutes.deleteSession(token), .global(), completion)
    }
}
