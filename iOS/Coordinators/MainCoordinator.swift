//
//  MainCoordinator.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {

    var childCoordinators = [CoordinatorProtocol]()
    
    unowned let presenter: UINavigationController
    
    required init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        if DefaultsManagerKeys.sessionIDKey.get() == nil {
            startLogin()
        } else {
            startHome()
        }
    }
    
    fileprivate func startHome() {
        let homeCoordinator = HomeCoordinator(presenter: presenter)
        homeCoordinator.delegate = self
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }
    
    fileprivate func startLogin() {
        let loginCoordinator = LoginCoordinator(presenter: presenter)
        loginCoordinator.delegate = self
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
    }
}

// MARK: - HomeCoordinatorDelegate
extension MainCoordinator: HomeCoordinatorDelegate {
    func didFinish(coordinator home: HomeCoordinator) {
        presenter.popViewController(animated: true)
        removeChild(coordinator: home)
    }
}

// MARK: - LoginCoordinatorDelegate
extension MainCoordinator: LoginCoordinatorDelegate {
    func didFinisH(coordinator login: LoginCoordinator) {
        presenter.popViewController(animated: true)
        removeChild(coordinator: login)
    }
}
