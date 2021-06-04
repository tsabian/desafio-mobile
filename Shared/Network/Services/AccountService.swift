//
//  AccountService.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/05/21.
//

import Foundation

protocol AccountServiceProtocol {
    func fetchAccount(completion: @escaping(AccountResponseModel) -> Void)
}

final class AccountService: BaseService, AccountServiceProtocol {
    func fetchAccount(completion: @escaping (AccountResponseModel) -> Void) {
        
    }
}
