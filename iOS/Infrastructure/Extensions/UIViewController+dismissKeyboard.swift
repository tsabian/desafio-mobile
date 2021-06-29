//
//  UIViewController+dismissKeyboard.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 29/06/21.
//

import UIKit

extension UIViewController {
    
    func hiddeKeyboardOnTapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
