//
//  AuthenticationUseCase.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/05/21.
//

import Foundation

// MARK: - AuthenticationUseCaseStatus
enum AuthenticationUseCaseStatus<Success: Codable> {
    case success(model: Success)
    case failure(responseError: BasicStatusResponseModel?)
}

// MARK: - Authentication use case protocol
protocol AuthenticationUseCaseProtocol: UseCaseProtocol {
    
    init(authenticationService: AuthenticationServiceProtocol)
    
    func getSession(completion: @escaping UseCaseCompletion<AuthenticationUseCaseStatus<TokenResponseModel>>)
    
    func validate(session model: ValidateLoginRequestModel,
                  completion: @escaping UseCaseCompletion<AuthenticationUseCaseStatus<TokenResponseModel>>)
    
    func create(session model: SessionRequestModel, completion: @escaping UseCaseCompletion<AuthenticationUseCaseStatus<SessionResponseModel>>)
}

// MARK: - Authentication use case
final class AuthenticationUseCase: AuthenticationUseCaseProtocol {

    private let authenticationService: AuthenticationServiceProtocol
    
    required init(authenticationService: AuthenticationServiceProtocol = AuthenticationService()) {
        self.authenticationService = authenticationService
    }
     
    func getSession(completion: @escaping UseCaseCompletion<AuthenticationUseCaseStatus<TokenResponseModel>>) {
        authenticationService.getSession { (tokenResponseModel, basicStatusResponseModel) in
            guard let token = tokenResponseModel else {
                completion(.failure(responseError: basicStatusResponseModel))
                return
            }
            if token.success {
                DefaultsManagerKeys.tokenKey.set(value: token.requestToken)
                DefaultsManagerKeys.tokenExpireKey.set(value: token.expiresAt)
            }
            completion(.success(model: token))
        }
    }
    
    func validate(session model: ValidateLoginRequestModel,
                  completion: @escaping UseCaseCompletion<AuthenticationUseCaseStatus<TokenResponseModel>>) {
        authenticationService.validate(with: model) { (tokenResponseModel, basicStatusResponseModel) in
            guard let token = tokenResponseModel else {
                completion(.failure(responseError: basicStatusResponseModel))
                return
            }
            if token.success {
                DefaultsManagerKeys.tokenKey.set(value: token.requestToken)
                DefaultsManagerKeys.tokenExpireKey.set(value: token.expiresAt)
            } else {
                DefaultsManagerKeys.tokenKey.remove()
                DefaultsManagerKeys.tokenExpireKey.remove()
            }
            completion(.success(model: token))
        }
    }
    
    func create(session model: SessionRequestModel,
                completion: @escaping UseCaseCompletion<AuthenticationUseCaseStatus<SessionResponseModel>>) {
        authenticationService.createSession(with: model) { (sessionResponse, basicStatusResponseModel) in
            guard let session = sessionResponse else {
                completion(.failure(responseError: basicStatusResponseModel))
                return
            }
            if session.success {
                DefaultsManagerKeys.sessionIDKey.set(value: session.sessionID)
            }
            completion(.success(model: session))
        }
    }
}
