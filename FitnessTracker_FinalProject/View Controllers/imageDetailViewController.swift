//
//  imageDetailViewController.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/25/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class imageDetailViewController:
UIViewController {
    
    
   
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var totalCalories: UITextField!
    @IBOutlet weak var bodyFat: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }
    


    
    
    @IBAction func res(_ sender: Any) {
        weight.resignFirstResponder()
        totalCalories.resignFirstResponder()
        bodyFat.resignFirstResponder()
    }
    

}
