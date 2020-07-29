//
//  image.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/25/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

var images = [Data]()
 var weights = [String]()
 var dates = [String]()
 var bodyFat = [String]()
 var calories = [String]()
 


var all1 = [["1":images,"2":dates]]

var dicti1:[String:[Any]] = [:]
var arrImage = ["images":images]

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}

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
 
                    if all1.capacity != 0 && arrImage.capacity != 0 {
            let rowdata1 = all1[0]
//            let rowdata_image = arrImage["images"]
            if(images.count != nil && dates != nil) {
                images = rowdata1["1"]! as! [Data]
                dates = rowdata1["2"]! as! [String]
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
        
        return 1
    }
    
    
    
    @IBAction func cancel(segue:UIStoryboardSegue) {}
    
    @IBAction func done(segue:UIStoryboardSegue) {
        let addVC = segue.source as! imageClickViewController
                    tableView.reloadData()
        if (addVC.imageViewer.image != nil) {
    
            let image = addVC.imageViewer.image
            let data = image?.pngData()
        
        let imageSaver = ImageSaver()
            imageSaver.writeToPhotoAlbum(image: image!)
        let imageBase64String = data?.base64EncodedString()
        UserDefaults.standard.set(imageBase64String, forKey: "\(addVC.dateTextToUpdate.text!)")
        images.append(data!)
        dates.append(addVC.dateTextToUpdate.text!)
        weights.append(addVC.datatosend["weights"] ?? "0")
        bodyFat.append(addVC.datatosend["bf"] ?? "0")
        calories.append(addVC.datatosend["calories"] ?? "0")
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
     
        return dates.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! ImageTableViewCell
        
        

        
        if let imageBase64String = UserDefaults.standard.value(forKey: "\(dates[indexPath.row])"),
            let url = URL(string: String(format:"data:application/octet-stream;base64,%@",imageBase64String as! CVarArg))
        {
            do
            {
                print("hello i came")
                let data =  try Data(contentsOf: url)
                let data2 = images[indexPath.row]
                if(data2 == data) {
                let image = UIImage(data: data)
                    print("did i ever happen")
                    cell.im.image = image
                    cell.im.image?.imageFlippedForRightToLeftLayoutDirection()
                }
            }
            catch _
            {
                print("Error decoding image")
            }
        }

        

        
        
        
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
extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}

