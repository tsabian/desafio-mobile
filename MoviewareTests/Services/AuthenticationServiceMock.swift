//
//  AuthenticationServiceMock.swift
//  MoviewareTests
//
//  Created by Tiago Oliveira on 05/06/21.
//

import Foundation
@testable import TmdbMovieware

final class AuthenticationServiceMock: AuthenticationServiceProtocol, TestableServiceMockProtocol {

    func getGuestSession(completion: @escaping AuthenticationCompletion<TokenResponseModel>) {
        let token: TokenResponseModel? = getMock(fileName: "get-token-200")
        completion(token, nil)
    }
    
    func getSession(completion: @escaping AuthenticationCompletion<TokenResponseModel>) {
        let token: TokenResponseModel? = getMock(fileName: "get-token-200")
        completion(token, nil)
    }
    
    func validate(with login: ValidateLoginRequestModel, completion: @escaping AuthenticationCompletion<TokenResponseModel>) {
        let token: TokenResponseModel? = getMock(fileName: "get-token-200")
        completion(token, nil)
    }
    
    func createSession(with token: SessionRequestModel, completion: @escaping AuthenticationCompletion<SessionResponseModel>) {
        let session: SessionResponseModel? = getMock(fileName: "post-validate-200")
        completion(session, nil)
    }
    
    func deleteSession(with token: DeleteSessionRequestModel, completion: @escaping AuthenticationCompletion<DeleteSessionResponseModel>) {
        let deleteSession: DeleteSessionResponseModel? = getMock(fileName: "delete-session-200")
        completion(deleteSession, nil)
    }
}
