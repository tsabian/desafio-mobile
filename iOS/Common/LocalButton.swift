//
//  LocalButton.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 27/06/21.
//

import UIKit

@IBDesignable
class LocalButton: UIButton {
    
    private let buttonHeight = CGFloat(44)
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: self.bounds.width, height: buttonHeight)
    }
}
