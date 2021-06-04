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
    
    init(accountService: AccountServiceProtocol)
    
    func login(completion: @escaping GetLoginCompletion)
}

// MARK: - Authentication use case
final class AuthenticationUseCase: AuthenticationUseCaseProtocol {

    private let accountService: AccountServiceProtocol
    
    required init(accountService: AccountServiceProtocol = AccountService()) {
        self.accountService = accountService
    }
    
    func login(completion: @escaping GetLoginCompletion) {
        
    }
}
