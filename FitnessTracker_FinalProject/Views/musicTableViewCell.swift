//
//  musicTableViewCell.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/23/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class musicTableViewCell: UITableViewCell {
    

    @IBOutlet weak var textOfMusic: UILabel!
    
    var Title:String = "" {
           didSet {
               if (Title != oldValue) {
                   textOfMusic.text = Title
               }
           }
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
