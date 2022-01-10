//
//  DescriptionCell.swift
//  MovieTest
//
//  Created by Diego Fernando on 09/01/22.
//

import UIKit

class DescriptionCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var favoritesButton: UIImageView!
    @IBOutlet private weak var likesLabel: UILabel!
    @IBOutlet private weak var likesImage: UIImageView!
    @IBOutlet private weak var imageViews: UIImageView!
    @IBOutlet private weak var viewsLabel: UILabel!
    
    // MARK: - Functions
    
    func setupUI(imagePath: String?, likesText: Int?) {
        
//        likesLabel.text = String(likesText ?? 0)
    }
}
