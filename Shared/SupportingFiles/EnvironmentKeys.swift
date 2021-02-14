//
//  EnvironmentKeys.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import Foundation

struct EnvironmentKeys {
    enum PList: String {
        case hostURL = "HOST_URL"
        case apiKey = "API_KEY"
        case appName = "APP_NAME"
    }
    
    private static let info: [String: Any] = {
        guard let dictionary = Bundle.local.infoDictionary else {
            fatalError("PList not found")
        }
        return dictionary
    }()
    
    static let hostURL: URL = {
        guard let hostURLString = EnvironmentKeys.info[PList.hostURL.rawValue] as? String,
              let url = URL(string: hostURLString) else {
            fatalError("HOST_URL not set in plist for this environment")
        }
        return url
    }()
    
    static let apiKey: String = {
        guard let apiKeyString = EnvironmentKeys.info[PList.apiKey.rawValue] as? String else {
            fatalError("API_KEY not set in plist for this environment")
        }
        return apiKeyString
    }()
    
    static let appName: String = {
        guard let appNameString = EnvironmentKeys.info[PList.appName.rawValue] as? String else {
            fatalError("APP_NAME not set in plist for this environment")
        }
        return appNameString
    }()
}
