//
//  LoginCoordinator.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 12/06/21.
//

import UIKit

protocol LoginCoordinatorProtocol {
    
}

protocol LoginCoordinatorDelegateProtocol: AnyObject {
    
}

class LoginCoordinator: CoordinatorProtocol {
    
    var childCoordinators = [CoordinatorProtocol]()
    
    weak var delegate: LoginCoordinatorDelegateProtocol?
    
    unowned let presenter: UINavigationController
    
    required init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let viewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: viewModel)
        presenter.pushViewController(viewController, animated: true)
    }
}
