//
//  Bundle.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import Foundation

extension Bundle {

    static var local: Bundle {
        return Bundle(for: AppDelegate.self)
    }

    var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }

    static func appVersion() -> String {
        if let buildVersion = self.main.buildNumber {
            let textArray = buildVersion.split(separator: Character("."))
            if !textArray.isEmpty {
                return String(textArray[0])
            }
        }
        return ""
    }
}
