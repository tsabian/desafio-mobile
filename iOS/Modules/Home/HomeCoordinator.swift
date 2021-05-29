//
//  HomeCoordinator.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import UIKit

 // MARK: - Home coordinator delegate protocol

protocol HomeCoordinatorDelegate: AnyObject {
    func didFinishHomeCoordinator()
}

// MARK: - Home coordinator

class HomeCoordinator: CoordinatorProtocol {
    
    var childCoordinators = [CoordinatorProtocol]()
    
    weak var delegate: HomeCoordinatorDelegate?
    
    private unowned let presenter: UINavigationController
    
    required init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let vController = HomeViewController()
        vController.viewModel = HomeViewModel()
        presenter.pushViewController(vController, animated: true)
    }
}
