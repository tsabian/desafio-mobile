//
//  MainCoordinator.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {

    var childCoordinators = [CoordinatorProtocol]()
    
    private unowned let presenter: UINavigationController
    
    required init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let vcontroller = HomeViewController()
        presenter.pushViewController(vcontroller, animated: true)
    }
}
