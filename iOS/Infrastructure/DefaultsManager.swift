//
//  DefaultsManager.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 05/06/21.
//

import Foundation

enum DefaultsManagerKeys: String {
    case tokenKey
    case tokenExpireKey
    case sessionIDKey
}

private final class DefaultsManager {
    
    static var shared = DefaultsManager()
    
    private let standard = UserDefaults.standard
    
    private init() {}
    
    func save<T>(key: DefaultsManagerKeys, value: T) {
        standard.setValue(value, forKey: key.rawValue)
    }
    
    func get<T>(key: DefaultsManagerKeys) -> T? {
        standard.object(forKey: key.rawValue) as? T
    }
    
    func delete(key: DefaultsManagerKeys) {
        standard.removeObject(forKey: key.rawValue)
    }
}

extension DefaultsManagerKeys {
    func set<T>(value: T) {
        DefaultsManager.shared.save(key: self, value: value)
    }
    
    func get<T>() -> T? {
        DefaultsManager.shared.get(key: self)
    }
    
    func remove() {
        DefaultsManager.shared.delete(key: self)
    }
}
