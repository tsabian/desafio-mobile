//
//  AuthenticationUseCaseTests.swift
//  MoviewareTests
//
//  Created by Tiago Oliveira on 05/06/21.
//

import XCTest
@testable import TmdbMovieware

class AuthenticationUseCaseTests: XCTestCase {

    private let usecase: AuthenticationUseCaseProtocol = AuthenticationUseCase(authenticationService: AuthenticationServiceMock())
    
    func testGetSessionShouldBySuccessfully() {
        let expectation = self.expectation(description: "testGetSessionShouldBySuccessfully")
        usecase.getSession { (token, basicStatus) in
            guard let token = token else {
                XCTFail("Token not should by null")
                return
            }
            XCTAssertNotNil(token.expiresAt)
            XCTAssertNotNil(token.success)
            XCTAssertNotNil(token.requestToken)
            XCTAssertNil(basicStatus)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}
