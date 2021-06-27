//
//  LocalizableKeys.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 26/06/21.
//

import Foundation

protocol LocalizableProtocol: RawRepresentable {
    var rawValue: String { get }
    var localized: String { get }
}

struct Localizable: LocalizableProtocol {
    var rawValue: String
}

extension LocalizableProtocol {
    private var defaultStringFile: String { "Default" }
    
    var localized: String { Bundle.local.localizedString(forKey: rawValue, value: nil, table: defaultStringFile) }
}

struct LocalizableKeys {

    struct Login {
        static var emailLabelTitle = Localizable(rawValue: "email")
        static var emailTextPlaceHolder = Localizable(rawValue: "enterEmail")
        static var passwordLabelTitle = Localizable(rawValue: "password")
        static var passwordTextPlaceHolder = Localizable(rawValue: "enterPassword")
        static var rememberPasswordLabelTitle = Localizable(rawValue: "rememberPassword")
        static var loginButtonTitle = Localizable(rawValue: "login")
        static var registerInfoLabelTitle = Localizable(rawValue: "registerAccount")
        static var registerButtonTitle = Localizable(rawValue: "register")
    }
    
}
