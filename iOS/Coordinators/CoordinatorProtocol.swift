//
//  CoordinatorProtocol.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    var identifier: String { get }
    
    var childCoordinators: [CoordinatorProtocol] { get set }

    init(presenter: UINavigationController)

    func start()
    
    func removeChild(coordinator: CoordinatorProtocol)
}

extension CoordinatorProtocol {
    subscript() -> CoordinatorProtocol? {
        get {
            guard let current = childCoordinators.first(where: { $0.identifier == identifier }) else {
                return nil
            }
            return current
        }
        set {
            guard let coordinator = newValue else {
                if let index = childCoordinators.firstIndex(where: { $0.identifier == identifier }) {
                    childCoordinators.remove(at: index)
                }
                return
            }
            if let index = childCoordinators.firstIndex(where: { $0.identifier == coordinator.identifier }) {
                childCoordinators[index] = coordinator
            } else {
                childCoordinators.append(coordinator)
            }
        }
    }

    var identifier: String {
        String(describing: Self.self)
    }
    
    func removeChild(coordinator: CoordinatorProtocol) {
        childCoordinators.removeAll(where: { $0 === coordinator })
    }
}
