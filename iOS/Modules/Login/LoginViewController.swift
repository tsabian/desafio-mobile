//
//  LoginViewController.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 12/06/21.
//

import UIKit

class LoginViewController: BaseViewController {
    
    var viewModel: LoginViewModelProtocol
    
    convenience init() {
        self.init(viewModel: LoginViewModel())
    }
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = LoginViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
