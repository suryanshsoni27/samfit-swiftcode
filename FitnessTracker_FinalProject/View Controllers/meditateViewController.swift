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
    @IBOutlet weak var resultLabel: UILabel!
    var pulsatingL:CAShapeLayer!
    
    
        @IBOutlet weak var imagemed: UIImageView!
    var seconds = 0
    var timer = Timer()
    
    private func animateLayer() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 0.5
            animation.duration = 4
        animation.autoreverses = true
        
        animation.repeatCount = Float.infinity
        pulsatingL.add(animation,forKey:"pulsing")
    }
    private func stopAnimate() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 0
        animation.duration = 0
        animation.speed = 0

        animation.repeatCount = Float.infinity
        pulsatingL.add(animation,forKey:"pulsing")

    }
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerlab.text = String(seconds) + " seconds"
    
        let circularPath = UIBezierPath(arcCenter: .init(x: 100, y: 100), radius: 20, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        pulsatingL = CAShapeLayer()
        pulsatingL.path = circularPath.cgPath
       pulsatingL.fillColor = UIColor.black.cgColor
       pulsatingL.lineWidth = 5
       pulsatingL.strokeColor = UIColor.lightGray.cgColor
        pulsatingL.backgroundColor = UIColor.clear.cgColor
        imagemed.layer.addSublayer(pulsatingL)
       
    }
  

    @IBAction func sliderFunc(_ sender: UISlider) {
        seconds = Int(sender.value)
        timerlab.text = String(seconds) + " seconds"
    }
    
    
    
    @IBAction func startFunc(_ sender: Any) {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(meditateViewController.counter), userInfo: nil, repeats: true)
        resultLabel.text = ""
        animateLayer()
       
    }
    
    @objc func counter() {
        seconds += 1
        timerlab.text = String(seconds) + " seconds"
        
        if seconds == 500 {
            
        }
        
    }
    
    
    @IBAction func timerstop(_ sender: Any) {
        timer.invalidate()
        stopAnimate()
        seconds = 0
        slider.setValue(0, animated: true)
        timerlab.text = "0" + " seconds"
        resultLabel.text = "You're relaxed now\n Try doing for longer"
    }
    
    
   
 
    
}
