//
//  ImageTableViewCell.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/25/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var im: UIImageView!
    @IBOutlet weak var Weigth: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var bodyFat: UILabel!
    @IBOutlet weak var calories: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
