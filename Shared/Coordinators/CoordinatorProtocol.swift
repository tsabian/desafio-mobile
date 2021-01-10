//
//  CoordinatorProtocol.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import UIKit

public protocol CoordinatorProtocol: AnyObject {

    var childCoordinators: [CoordinatorProtocol] { get set }

    init(presenter: UINavigationController)

    func start()

}
