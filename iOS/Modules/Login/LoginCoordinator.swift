//
//  LoginCoordinator.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 12/06/21.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func didFinisH(coordinator login: LoginCoordinator)
}

class LoginCoordinator: CoordinatorProtocol {
    
    var childCoordinators = [CoordinatorProtocol]()
    
    weak var delegate: LoginCoordinatorDelegate?
    
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
