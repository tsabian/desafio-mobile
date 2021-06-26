//
//  LoginViewModel.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 12/06/21.
//

import Foundation

// MARK: - LoginViewModelViewStatus
enum LoginViewModelViewStatus {
    case loginSuccess
    case loginFailure
    case genericFailure
    case credentialsCannotBeNull
}

// MARK: - LoginViewModelProtocol
protocol LoginViewModelProtocol {
    
    var viewStatus: Bindable<LoginViewModelViewStatus> { get }
    
    func signInWithCredentials(email: String?, andSecurityPassword password: String?)
}

// MARK: - LoginViewModel
class LoginViewModel: LoginViewModelProtocol {
    
    private let authenticationUseCase: AuthenticationUseCaseProtocol
    
    var viewStatus: Bindable = Bindable<LoginViewModelViewStatus>()
    
    init(authenticationUseCase: AuthenticationUseCaseProtocol = AuthenticationUseCase()) {
        self.authenticationUseCase = authenticationUseCase
    }
    
    func signInWithCredentials(email: String?, andSecurityPassword password: String?) {
        guard let email = email, let password = password,
              !email.isEmpty, password.isEmpty else {
            viewStatus.value = .credentialsCannotBeNull
            return
        }
        authenticationUseCase.getSession { useCaseStatus in
            guard let status = useCaseStatus else {
                self.viewStatus.value = .genericFailure
                return
            }
            switch status {
            case .failure(let error):
                self.checkResponse(error: error)
            case .success(let token):
                let login = ValidateLoginRequestModel(userName: email,
                                                      password: password,
                                                      requestToken: token.requestToken)
                self.credentials(validate: login)
            }
        }
    }
    
    private func credentials(validate: ValidateLoginRequestModel) {
        authenticationUseCase.validate(session: validate) { useCaseStatus in
            guard let status = useCaseStatus else {
                return
            }
            switch status {
            case .failure(let validatedError):
                self.checkResponse(error: validatedError)
            case .success(let validatedSuccessfully):
                let requestSession = SessionRequestModel(requestToken: validatedSuccessfully.requestToken)
                self.createSession(with: requestSession)
            }
        }
    }
    
    private func createSession(with request: SessionRequestModel) {
        authenticationUseCase.create(session: request) { useCaseStatus in
            guard let status = useCaseStatus else {
                return
            }
            switch status {
            case .failure(let sessionError):
                self.checkResponse(error: sessionError)
            case .success:
                self.viewStatus.value = .loginSuccess
            }
        }
    }
    
    private func checkResponse(error: BasicStatusResponseModel?) {
        guard let error = error else {
            viewStatus.value = .genericFailure
            return
        }
        switch error.statusCode {
        default:
            viewStatus.value = .genericFailure
        }
    }
}
