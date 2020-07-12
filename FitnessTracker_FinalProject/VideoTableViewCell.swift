//
//  VideoTableViewCell.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/11/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var VI: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
