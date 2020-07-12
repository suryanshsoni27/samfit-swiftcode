//
//  ThreeButtonsForSelectViewController.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/8/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class ThreeButtonsForSelectViewController: UIViewController {

    //MARK: outlets for buttons
    @IBOutlet weak var TrackCalButton: UIButton!
    @IBOutlet weak var FitCookingButton: UIButton!
    @IBOutlet weak var trainingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
//        Utilities.styleFilledButton(TrackCalButton)
//        Utilities.styleFilledButton(FitCookingButton)
//        Utilities.styleFilledButton(trainingButton)
    }
    
    // Set the shouldAutorotate to False
    override open var shouldAutorotate: Bool {
       return false
    }

    // Specify the orientation.
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       return .portrait
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
