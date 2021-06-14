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
        let homeCoordinator = HomeCoordinator(presenter: presenter)
        homeCoordinator.delegate = self
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }
    
    func didFinishChildCoordinator(_ child: CoordinatorProtocol?) {
        childCoordinators.removeAll(where: { $0 === child })
    }
}

// MARK: - HomeCoordinatorDelegate
extension MainCoordinator: HomeCoordinatorDelegate {
    func didFinishHomeCoordinator() {
        presenter.popViewController(animated: true)
        childCoordinators.removeLast()
    }
}
