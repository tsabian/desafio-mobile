//
//  HomeViewController.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel: HomeViewModel!
    
    // MARK: - Outlets
    @IBOutlet weak var mediaSelection: UISegmentedControl!
    @IBOutlet weak var mediaCollection: MediaListView! {
        didSet {
            
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
