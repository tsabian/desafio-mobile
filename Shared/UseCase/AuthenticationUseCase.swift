//
//  AuthenticationUseCase.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/05/21.
//

import Foundation

// MARK: - Authentication use case protocol
protocol AuthenticationUseCaseProtocol: UseCaseProtocol {
    
    init(authenticationService: AuthenticationServiceProtocol)
    
    func getSession(completion: @escaping UseCaseCompletion<TokenResponseModel>)
    func validate(session model: ValidateLoginRequestModel, completion: @escaping UseCaseCompletion<TokenResponseModel>)
    func create(session model: SessionRequestModel, completion: @escaping UseCaseCompletion<SessionResponseModel>)
}

// MARK: - Authentication use case
final class AuthenticationUseCase: AuthenticationUseCaseProtocol {

    private let authenticationService: AuthenticationServiceProtocol
    
    required init(authenticationService: AuthenticationServiceProtocol = AuthenticationService()) {
        self.authenticationService = authenticationService
    }
     
    func getSession(completion: @escaping UseCaseCompletion<TokenResponseModel>) {
        authenticationService.getSession { (tokenResponseModel, basicStatusResponseModel) in
            guard let token = tokenResponseModel else {
                completion(nil, basicStatusResponseModel)
                return
            }
            if token.success {
                DefaultsManagerKeys.tokenKey.set(value: token.requestToken)
                DefaultsManagerKeys.tokenExpireKey.set(value: token.expiresAt)
            }
            completion(tokenResponseModel, nil)
        }
    }
    
    func validate(session model: ValidateLoginRequestModel, completion: @escaping UseCaseCompletion<TokenResponseModel>) {
        authenticationService.validate(with: model) { (tokenResponseModel, basicStatusResponseModel) in
            guard let token = tokenResponseModel else {
                completion(nil, basicStatusResponseModel)
                return
            }
            if token.success {
                DefaultsManagerKeys.tokenKey.set(value: token.requestToken)
                DefaultsManagerKeys.tokenExpireKey.set(value: token.expiresAt)
            } else {
                DefaultsManagerKeys.tokenKey.remove()
                DefaultsManagerKeys.tokenExpireKey.remove()
            }
            completion(tokenResponseModel, nil)
        }
    }
    
    func create(session model: SessionRequestModel, completion: @escaping UseCaseCompletion<SessionResponseModel>) {
        authenticationService.createSession(with: model) { (sessionResponse, basicStatusResponseModel) in
            guard let session = sessionResponse else {
                completion(nil, basicStatusResponseModel)
                return
            }
            if session.success {
                DefaultsManagerKeys.sessionIDKey.set(value: session.sessionID)
            }
            completion(session, nil)
        }
    }
}
