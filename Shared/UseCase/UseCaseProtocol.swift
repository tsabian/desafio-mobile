//
//  UseCaseProtocol.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/05/21.
//

import Foundation

protocol UseCaseProtocol {
    typealias UseCaseCompletion<T> = (T?) -> Void
}
