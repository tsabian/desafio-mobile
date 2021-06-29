//
//  FontManager.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/06/21.
//

import UIKit

protocol FontManagerProtocol {
    
    var fontName: String { get }
    
    func bold(size: CGFloat) -> UIFont
    
    func light(size: CGFloat) -> UIFont
    
    func medium(size: CGFloat) -> UIFont
    
    func regular(size: CGFloat) -> UIFont
}

extension FontManagerProtocol {
    
    func bold(size: CGFloat) -> UIFont {
        let font = UIFont(name: "\(fontName)-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
        return font
    }
    
    func light(size: CGFloat) -> UIFont {
        let font = UIFont(name: "\(fontName)-Light", size: size) ?? UIFont.systemFont(ofSize: size)
        return font
    }
    
    func medium(size: CGFloat) -> UIFont {
        let font = UIFont(name: "\(fontName)-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
        return font
    }
    
    func regular(size: CGFloat) -> UIFont {
        let font = UIFont(name: "\(fontName)-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
        return font
    }
}
