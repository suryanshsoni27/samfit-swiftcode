//
//  powerliftvideosViewController.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/13/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class powerliftvideosViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, ModelDelegate2 {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = Model2()
    var videos = [Video]()
        
        
        

        
        override func viewDidLoad() {
            super.viewDidLoad()

            tableView.dataSource = self
            tableView.delegate = self
            
            model.delegate = self
            model.getVideos()
        }
        
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
      
            guard tableView.indexPathForSelectedRow != nil else {
                return
            }
            let sv = videos[tableView.indexPathForSelectedRow!.row]
        
            let detailVC = segue.destination as! PowerliftDetailViewController
            detailVC.video = sv
        
        }
        
        
        
        //MARK: - model delegate
        func videosFetched(_ videos: [Video]) {
            self.videos = videos
            tableView.reloadData()
        }

        
        
        //MARK: - table methods
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return videos.count
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants2.VIDEOCELL_ID, for: indexPath) as! powerliftTableViewCell
            let video1 =  self.videos[indexPath.row]
            cell.setCell(video1)
            return cell
          }


        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        }
        

    }

    

   

