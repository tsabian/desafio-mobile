//
//  LocalButton.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 27/06/21.
//

import UIKit

enum LocalButtonStyle {
    case none
    case fillStyle
}

@IBDesignable
class LocalButton: UIButton {
    
    private let buttonHeight = CGFloat(44)
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: self.bounds.width, height: buttonHeight)
    }
    
    var buttonStyle: LocalButtonStyle = .fillStyle {
        didSet {
            switch buttonStyle {
            case .fillStyle:
                setFillButtonStyle()
            default:
                break
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setFillButtonStyle() {
        backgroundColor = UIColor(named: "#FFBB3B")
        setRound(radius: 8)
        setTitleFont()
        setShadow()
    }
    
    private func setTitleFont() {
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.font = FontManager.shared.bold(size: 14)
    }
    
    private func setRound(radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
    }
    
    private func setShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor(named: "#FFBB3B")?.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
    }
}
