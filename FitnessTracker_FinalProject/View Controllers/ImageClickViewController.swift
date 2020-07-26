//
//  imageClickViewController.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/25/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class imageClickViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageViewer: UIImageView!
    
    
    
    @IBOutlet weak var weightText: UITextField!
  
    
    
    @IBOutlet weak var dateTextToUpdate: UILabel!
    
  
    
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func take(_ sender: Any) {
        
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera

        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func dateChangeButton(_ sender: Any) {
            
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.dateStyle = .long
            let dateTimeString = formatter.string(from: currentDate)
            
            dateTextToUpdate.text = dateTimeString
            
            
        }
    
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageViewer.image = info[.originalImage] as? UIImage
        
    }
    
    
    
  
    
    
    
    
    @IBAction func tapgest(_ sender: Any) {
        
    }
    
    
    
    
    
           
           
           
       
    
    
    

}
