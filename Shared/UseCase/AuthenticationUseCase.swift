//
//  AuthenticationUseCase.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/05/21.
//

import Foundation

// MARK: - Authentication use case protocol
protocol AuthenticationUseCaseProtocol {
    typealias GetLoginCompletion = (AccountSessionModel) -> Void
    
    init(service: AccountServiceProtocol)
    
    func login(completion: @escaping GetLoginCompletion)
}

// MARK: - Authentication use case
final class AuthenticationUseCase: AuthenticationUseCaseProtocol {
    
    let service: AccountServiceProtocol
    
    required init(service: AccountServiceProtocol = AccountService()) {
        self.service = service
    }
    
    func login(completion: @escaping GetLoginCompletion) {
        
    }
}
