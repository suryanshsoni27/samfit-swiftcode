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
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var totalCalories: UITextField!
    @IBOutlet weak var bodyFat: UITextField!
    
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
    
    
    @IBAction func res(_ sender: Any) {
        weight.resignFirstResponder()
        totalCalories.resignFirstResponder()
        bodyFat.resignFirstResponder()
    }
    

}
