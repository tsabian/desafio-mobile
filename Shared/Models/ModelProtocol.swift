//
//  ModelProtocol.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import Foundation

protocol ModelProtocol: Codable {
    func toJson() -> String
    static func toModel<T: ModelProtocol>(from string: String) throws -> T?
    static func toModel<T: ModelProtocol>(from data: Data) throws -> T?
}

// MARK: - ModelProtocol Extension
extension ModelProtocol {
    
    func toJson() -> String {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(.iso8601FSBackend)
        var jsonString = ""
        do {
            let jsonData = try encoder.encode(self)
            jsonString = String(data: jsonData, encoding: .utf8) ?? ""
        } catch let parseError {
            #if DEBUG
            debugPrint(parseError.localizedDescription)
            #endif
        }
        return jsonString
    }

    static func toModel<T: ModelProtocol>(from string: String) throws -> T? {
        guard let data = string.data(using: .utf8) else {
            return nil
        }
        var model: T?
        do {
            model = try toModel(from: data)
        } catch let parserError {
            throw parserError
        }
        return model
    }
    
    static func toModel<T: ModelProtocol>(from data: Data) throws -> T? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.iso8601UTC)
        do {
            let json = try decoder.decode(T.self, from: data)
            return json
        } catch let parseError {
            throw parseError
        }
    }
}
