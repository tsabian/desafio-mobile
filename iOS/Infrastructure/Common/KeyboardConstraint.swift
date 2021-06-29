//
//  KeyboardConstraint.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 27/06/21.
//

import UIKit

class KeyboardContraint: NSLayoutConstraint {
    
    private var originalConstant: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        originalConstant = self.constant
        addObservers()
    }
    
    deinit {
        removeObservers()
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardWillHideNotification,
            object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)),
                                               name: UIResponder.keyboardDidShowNotification,
            object: nil)
    }
    
    private func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc func keyboardDidHide() {
        constant = originalConstant
    }
    
    @objc func keyboardDidShow(notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let frame = keyboardFrame.cgRectValue
        if constant == originalConstant {
            constant += frame.size.height
        } else if frame.size.height > constant {
            constant += frame.size.height - constant
        }
    }
}
