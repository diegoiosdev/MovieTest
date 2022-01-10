//
//  ImageCell.swift
//  MovieTest
//
//  Created by Diego Fernando on 09/01/22.
//

import UIKit

class ImageCell: UITableViewCell {
    
    // MARK: - Properties
    
    var viewModel: MovieTestViewModelProtocol?
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var imageMain: UIImageView!
    
    // MARK: Initializer
    
    func setupUI(imagePath: String?) {
        
        guard (imagePath != nil) else { return }
        
        viewModel?.getImage(with: imagePath) { [weak self] data in
            
            guard let strongSelf = self,
                  let data = data else { return }
            
            strongSelf.imageMain.image = UIImage(data: data)
        }
    }
}
