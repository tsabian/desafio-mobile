//
//  Bindable.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import Foundation

class Bindable<Input> {
    
    typealias BindableHandler = (Input?) -> Void
    
    private var observer: BindableHandler?
    
    var value: Input? {
        didSet {
            observer?(value)
        }
    }
    
    func bind(observer: @escaping BindableHandler) {
        self.observer = observer
    }
    
    func bind<Target: AnyObject>(to target: Target, with bind: @escaping (Target, Input?) -> Void) {
        self.bind { [weak target] input in
            guard let target = target else { return }
            bind(target, input)
        }
    }
    
    func unbind() {
        observer = nil
    }
}
