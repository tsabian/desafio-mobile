//
//  HomeViewController.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 13/06/21.
//

import UIKit

class HomeViewController: BaseViewController {

    var viewModel: HomeViewModelProtocol?
    
    // MARK: - Construtor
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = nil
        super.init(coder: coder)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
