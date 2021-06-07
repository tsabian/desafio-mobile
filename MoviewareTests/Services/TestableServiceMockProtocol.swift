//
//  TestableServiceMockProtocol.swift
//  MoviewareTests
//
//  Created by Tiago Oliveira on 05/06/21.
//

import Foundation

protocol TestableServiceMockProtocol: AnyObject {
    func getMock<T: Codable>(fileName: String) -> T?
}

extension TestableServiceMockProtocol {
    func getMock<T: Codable>(fileName: String) -> T? {
        guard let bundleURL = Bundle(for: type(of: self)).url(forResource: fileName, withExtension: "json"),
              let fileData = try? Data(contentsOf: bundleURL, options: .dataReadingMapped) else {
            return nil
        }
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(.iso8601UTC)
        do {
            let model: T = try jsonDecoder.decode(T.self, from: fileData)
            return model
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
