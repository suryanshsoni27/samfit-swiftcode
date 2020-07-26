//
//  image.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/25/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class image: UITableViewController {
    var images = [Any]()
    var weights = [String]()
    var dates = [String]()
    var bodyFat = [String]()
    var calories = [String]()
    
   
//    var all = [Any]()
//    var dicti:[Int:Any] = [:]
    
    

    override func viewDidLoad() {
        
        
         super.viewDidLoad()
//                let arrayKey1 = "arrayKey1"
//                let url1 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
//                let myURL1 = url1.appendingPathComponent("fileName1")
//                if let data1 = NSMutableData(contentsOf: myURL1) {
//                           let unarchiver = NSKeyedUnarchiver(forReadingWith: data1 as Data)
//                    if let anArray1 = unarchiver.decodeObject(forKey: arrayKey1) {
//                               unarchiver.finishDecoding()
//                        all = anArray1 as! [[AnyHashable : Any]]
//                           }
//        }
//
//        print(all)
//        if all.capacity != 0 {
//
//            let rowdata1 = all[0]
//            print(rowdata1)
//
//
//            tableView.reloadData()
//        }
//
   
         
            
            



        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    
    @IBAction func cancel(segue:UIStoryboardSegue) {}
    
    @IBAction func done(segue:UIStoryboardSegue) {
        let addVC = segue.source as! imageClickViewController
                    tableView.reloadData()
        images.append(addVC.imageViewer.image as Any)
        dates.append(addVC.dateTextToUpdate.text!)
        tableView.reloadData()
        
//        dicti[1] = images
//        dicti[2] = dates
//

        
      
        
        
        }
    
    
  
        
        @IBAction func doneagain(segue:UIStoryboardSegue) {
            let detailVC = segue.source as! imageDetailViewController
            tableView.reloadData()
            weights.append(detailVC.weight.text!)
            calories.append(detailVC.totalCalories.text!)
            bodyFat.append(detailVC.bodyFat.text!)
            tableView.reloadData()
            
//            dicti[3] = weights
//            dicti[4] = calories
//            dicti[5] = bodyFat
//
//            all.append(dicti)
//
//            let url1  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
//                     let myURL1 = url1.appendingPathComponent("fileName1")
//
//                     let arrayKey1 = "arrayKey1"
//                     let archiver1 = NSKeyedArchiver(requiringSecureCoding: true)
//                     archiver1.encode(all, forKey: arrayKey1)
//                     let data1 = archiver1.encodedData
//                   do {
//                      try data1.write(to: myURL1)}
//                   catch {
//
//                   }
                 

           
    }
            
        
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! ImageTableViewCell
        cell.im.image = images[indexPath.row] as? UIImage
        cell.date.text = dates[indexPath.row]
        if weights.count != 0 {
        cell.Weigth.text = weights[indexPath.row] + "kg/lbs"
        }
        if bodyFat.count != 0 {
               cell.bodyFat.text = bodyFat[indexPath.row] + "%"
               }
        if calories.count != 0 {
               cell.calories.text = calories[indexPath.row] + "kcal"
               }
        
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let imc = imageDetailViewController()
//        if images.count != 0 {
//            imc.image = images[indexPath.row] as? UIImageView
//        }
//        if bodyFat.count != 0 && bodyFat[indexPath.row] != nil {
//            imc.bodyFat.text! = bodyFat[indexPath.row]
//        }
//        
//        
//        if weights.count != 0 && weights[indexPath.row] != nil {
//        imc.weight.text! = weights[indexPath.row]
//        }
//        if calories.count != 0 && calories[indexPath.row] != nil {
//        imc.totalCalories.text! = calories[indexPath.row]
//        }
        
        
    
   

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       if segue.identifier == "detailView" {
//           let tbc = sender as! UITableViewCell
//           let indexPath = tableView.indexPath(for: tbc)!
//
//
//           let detailVC = segue.destination as! imageDetailViewController
//        detailVC.image = images[indexPath.row] as? UIImageView
//        detailVC.bodyFat.text = bodyFat[indexPath.row]
//        detailVC.weight.text = weights[indexPath.row]
//        detailVC.totalCalories.text = calories[indexPath.row]
//
//       }
//       else if segue.identifier == "addImage" {
//        segue.destination as! imageClickViewController
//        }
//
//    }
   






}
