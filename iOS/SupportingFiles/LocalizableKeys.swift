//
//  LocalizableKeys.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 26/06/21.
//

import Foundation

protocol LocalizableKeysProtocol: RawRepresentable {
    var rawValue: String { get }
    var localized: String { get }
}

extension LocalizableKeysProtocol {
    var localized: String { NSLocalizedString(rawValue, comment: "") }
}

struct LocalizableKeys {

    struct LoginLocalizable: LocalizableKeysProtocol {
        var rawValue: String
        
        static var emailTextPlaceHolder = LoginLocalizable(rawValue: "enterEmail")
        static var passwordTextPlaceHolder = LoginLocalizable(rawValue: "enterPassword")
        static var rememberPasswordLabelTitle = LoginLocalizable(rawValue: "rememberPassword")
        static var loginButtonTitle = LoginLocalizable(rawValue: "login")
        static var registerInfoLabelTitle = LoginLocalizable(rawValue: "registerAccount")
        static var registerButtonTitle = LoginLocalizable(rawValue: "register")
    }
    
}
