//
//  Environment.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import Foundation

public class Environment {
    
    static var shared = Environment()
    
    private init() { }
    
    private let infoDictionary: [String: Any] = {
        guard let dic = Bundle.local.infoDictionary else {
            fatalError("PList file not found")
        }
        return dic
    }()

    func get<T>(plistKey: EnvironmentKeys.PList) -> T {
        guard let rootURLString = infoDictionary[plistKey.rawValue] as? T else {
            fatalError("\(plistKey.rawValue) not set in plist this environment")
        }
        return rootURLString
    }
    
}
