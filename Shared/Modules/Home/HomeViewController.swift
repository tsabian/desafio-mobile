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
    @IBOutlet weak var titleLabel: UILabel? {
        didSet {
            titleLabel?.text = "Home Movie"
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
