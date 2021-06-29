//
//  Fonts.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/06/21.
//

import Foundation

class FontManager: FontManagerProtocol {
    var fontName: String = "Exo2"
    
    static var shared = FontManager()
    
    private init() { }
}
