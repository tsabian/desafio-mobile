//
//  MediaCollectionViewCell.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewCell {

    // MARK: - Constants
    private let cellWidth = CGFloat(290)
    private let cellHeight = CGFloat(394)
    
    // MARK: - Outlets
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var shortDescriptionView: UIView!
    @IBOutlet weak var shortDescriptionText: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
