//
//  image.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/25/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

var images = [UIImage]()
 var weights = [String]()
 var dates = [String]()
 var bodyFat = [String]()
 var calories = [String]()
 

var all1 = [["1":images,"2":dates]]
var dicti1:[String:[Any]] = [:]


class image: UITableViewController {

    

    override func viewDidLoad() {
         super.viewDidLoad()
                let arrayKey1 = "arrayKey1"
                let url1 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
                let myURL1 = url1.appendingPathComponent("fileName1")
                if let data1 = NSMutableData(contentsOf: myURL1) {
                           let unarchiver = NSKeyedUnarchiver(forReadingWith: data1 as Data)
                    if let anArray1 = unarchiver.decodeObject(forKey: arrayKey1) {
                               unarchiver.finishDecoding()
                        all1 = anArray1 as! [[String : [Any]]]
                           }
 
            if all1.capacity != 0 {
            let rowdata1 = all1[0]
            if(images != nil && dates != nil) {
            images = rowdata1["1"] as! [UIImage]
            dates = rowdata1["2"] as! [String]
            weights = rowdata1["3"]! as! [String]
            calories = rowdata1["4"]! as! [String]
            bodyFat = rowdata1["5"]! as! [String]
            }
          tableView.reloadData()
            }
        }
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
        if (addVC.imageViewer.image != nil) {
        images.append(addVC.imageViewer.image!)
        dates.append(addVC.dateTextToUpdate.text!)
        weights.append(addVC.datatosend["weights"]!)
        bodyFat.append(addVC.datatosend["bf"]!)
        calories.append(addVC.datatosend["calories"]!)
        }
        dicti1["1"] = images
        dicti1["2"] = dates
        dicti1["3"] = weights
        dicti1["4"] = bodyFat
        dicti1["5"] = calories
        all1.insert(dicti1, at: 0)

        let url1  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
                 let myURL1 = url1.appendingPathComponent("fileName1")

                 let arrayKey1 = "arrayKey1"
                 let archiver1 = NSKeyedArchiver(requiringSecureCoding: true)
                 archiver1.encode(all1, forKey: arrayKey1)
                 let data1 = archiver1.encodedData
               do {
                  try data1.write(to: myURL1)}
               catch {

               }

        tableView.reloadData()
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
        cell.im.image = images[indexPath.row] as UIImage
        cell.Weigth.text = weights[indexPath.row]
        cell.date.text = dates[indexPath.row]
        cell.bodyFat.text = bodyFat[indexPath.row] + "%"
        cell.calories.text = calories[indexPath.row] + "kcal"
        return cell
    }

    

        
    
   

   
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            images.remove(at: indexPath.row)
            dates.remove(at: indexPath.row)
            weights.remove(at: indexPath.row)
            calories.remove(at: indexPath.row)
            bodyFat.remove(at: indexPath.row)
            dicti1["1"] = images
            dicti1["2"] = dates
            dicti1["3"] = weights
            dicti1["4"] = bodyFat
            dicti1["5"] = calories
            all1.insert(dicti1, at: 0)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()

                      }
        let url1  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
          let myURL1 = url1.appendingPathComponent("fileName1")

          let arrayKey1 = "arrayKey1"
          let archiver1 = NSKeyedArchiver(requiringSecureCoding: true)
          archiver1.encode(all1, forKey: arrayKey1)
          let data1 = archiver1.encodedData
        do {
           try data1.write(to: myURL1)}
        catch {

        }
    }
 

   






}

