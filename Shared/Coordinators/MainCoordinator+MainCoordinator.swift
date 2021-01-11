//
//  MainCoordinator+MainCoordinator.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import Foundation

extension MainCoordinator: HomeCoordinatorDelegate {
    func didFinishHomeCoordinator() {
        presenter.popViewController(animated: true)
        childCoordinators.removeLast()
    }
}
