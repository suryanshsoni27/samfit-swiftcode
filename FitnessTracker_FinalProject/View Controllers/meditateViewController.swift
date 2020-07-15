//
//  meditateViewController.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/14/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class meditateViewController: UIViewController {
    @IBOutlet weak var timerlab: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    var seconds = 0
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        timerlab.text = String(seconds) + " seconds"
    }
  

    @IBAction func sliderFunc(_ sender: UISlider) {
        seconds = Int(sender.value)
        timerlab.text = String(seconds) + " seconds"
    }
    
    
    
    @IBAction func startFunc(_ sender: Any) {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(meditateViewController.counter), userInfo: nil, repeats: true)
    }
    
    @objc func counter() {
        seconds += 1
        timerlab.text = String(seconds) + " seconds"
        
        if seconds == 500 {
            
        }
        
    }
    
    
    @IBAction func timerstop(_ sender: Any) {
        timer.invalidate()
        seconds = 0
        slider.setValue(0, animated: true)
        timerlab.text = "0" + " seconds"
    }
    
    
    
}
