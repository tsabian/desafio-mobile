//
//  HomeViewController.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 13/06/21.
//

import UIKit

class HomeViewController: BaseViewController {

    var viewModel: HomeViewModelProtocol?

    // MARK: - Life Cycle
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        viewModel = nil
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
