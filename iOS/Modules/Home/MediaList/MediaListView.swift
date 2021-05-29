//
//  MediaListView.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import UIKit

class MediaListView: UIView {

    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var moviesCollection: UICollectionView! {
        didSet {
            moviesCollection.delegate = self
            moviesCollection.dataSource = self
        }
    }
    
}

// MARK: - UICollectionViewDelegate
extension MediaListView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension MediaListView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
}
