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
        return String(describing: Self.self)
    }
}

// MARK: - Equatable
extension CoordinatorProtocol where Self: Equatable {
    static func==(lhs: CoordinatorProtocol, rhs: CoordinatorProtocol) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
