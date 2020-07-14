//
//  FitkitchenTableViewCell.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/12/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class FitkitchenTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageViewThumb: UIImageView!
    
    @IBOutlet weak var titleLab: UILabel!
    
    
    @IBOutlet weak var dataLab: UILabel!
    
    var video:Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
      func setCell(_ v:Video) {
            
            self.video = v
            
    
            guard self.video != nil else {
                return
            }
            
            self.titleLab.text = video?.title
            
          
            let df = DateFormatter()
            df.dateFormat = "EEEE, MMM d, yyyy"
            self.dataLab.text = df.string(from: video!.published)
            
            
            guard self.video!.thumbnail != "" else {
                return
            }

            // Check cache before downloading data
          if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
                
                // Set the thumbnail imageview
                self.imageViewThumb.image = UIImage(data: cachedData)
                return
            }
            
            // Download the thumbnail data
            let url = URL(string: self.video!.thumbnail)
            
            // Get the shared URL Session object
            let session = URLSession.shared
            
            // Create a data task
            let dataTask = session.dataTask(with: url!) { (data, response, error) in
                
                if error == nil && data != nil {
                    
    
                    CacheManager.setVideoCache(url!.absoluteString, data)
                  
                   
                    if url!.absoluteString != self.video?.thumbnail {
                 
                        return
                    }
            
                    let image = UIImage(data: data!)
                    
            
                    DispatchQueue.main.async {
                        self.imageViewThumb.image = image
                    }
                    
                }
                
            }

            dataTask.resume()
        }

    }
