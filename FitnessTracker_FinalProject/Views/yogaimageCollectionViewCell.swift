//
//  yogaimageCollectionViewCell.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/14/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class yogaimageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    static var identifier = "yogaimageCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    
    public func configure(with image: UIImage) {
        imageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName:"yogaimageCollectionViewCell", bundle: nil)
    }
}
