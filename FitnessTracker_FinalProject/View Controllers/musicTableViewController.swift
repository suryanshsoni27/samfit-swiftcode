//
//  musicTableViewController.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/23/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit
import AVFoundation

class musicTableViewController: UITableViewController {

   

    
    var music = [Music]()
    var player: AVAudioPlayer?
    
    func configureSongs() {
       music.append(Music(music: 1))
       music.append(Music(music: 2))
       music.append(Music(music: 3))
        music.append(Music(music: 4))
        music.append(Music(music: 5))
        music.append(Music(music: 6))
        music.append(Music(music: 7))
        music.append(Music(music: 8))
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return music.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 200
      }
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! musicTableViewCell
        cell.Title = "Relaxation Music\(indexPath.row + 1)"
        
        return cell
        
    }
  
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let pos = indexPath.row
        
        let song = music[pos]
        print(song)

        let urlString = Bundle.main.path(forResource: String(song.music), ofType: "mp3")

        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else {
                print("urlstring is nil")
                return
            }

            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let player = player else {
                print("player is nil")
                return
            }
            player.volume = 0.9

            player.play()
        }
        catch {
            print("error occurred")
        }
        
        
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
    */
    

    
    
    @IBAction func playPause(_ sender: UIButton) {
    
        if player?.isPlaying == true {
            // pause
            player?.pause()
            // show play button
            
            

         
           
        }
        else {
            // play
            player?.play()
           

        
           
        }
        
        
    }
    
}

struct Music {
    var music = 1
    
}
