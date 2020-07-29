//
//  cardioViewController.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/13/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class cardioViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    private let workouttype = 0
    private let time = 1
    private let MET = [
        "Running":11.5,"Swimming":6,"Brisk Walking":4.5,"Bicycling":8,"Circuit training":8,"tennis":8,"Soccer":10,"Weight training(Heavy weights)":5,"Weight training(light weights)":5,"Yoga":2

    ]
    
    private let workouttypes = [
           "Running","Brisk Walking","Swimming","Bicycling","Circuit training","tennis","Soccer","Weight training(Heavy weights)","Weight training(light weights)","Yoga"
           
       ]
    
    let times = Array(0...1000)
   
    
    
    
    @IBOutlet weak var kgtolb: UISegmentedControl!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var caloriText: UITextField!
    
    @IBOutlet weak var picker: UIPickerView!
    
    
    
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
    
    
    
    @IBAction func calButton(_ sender: Any) {
        let workoutrow = picker.selectedRow(inComponent: workouttype)
        let timerow = picker.selectedRow(inComponent: time)
        let w = workouttypes[workoutrow]
        let t = times[timerow]
        let message = "Workout \(w) \tfor time\(t) mins "
        let alert = UIAlertController(title: "Good Luck", message: message, preferredStyle:  .actionSheet)
        let action  = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        
      
        
        guard let weigh = self.weightText.text, weigh != "" else {
                                                                  let controller = UIAlertController (title:"You did enter anything",message: nil, preferredStyle: .alert)
                                                                  let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                                                  controller.addAction(cancelAction)
                                                                  self.present(controller,animated: true,completion: nil)
                                                                  return
                                                              }
        guard self.weightText.text != nil , let callw = Double(self.weightText.text!), callw >= 0.0 else{
                                                                  let controller = UIAlertController (title:"values not provided",message: nil, preferredStyle: .alert)
                                                                  let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                                                  controller.addAction(cancelAction)
                                                                  self.present(controller,animated: true,completion: nil)
                                                                  return
                                                                  
                                                              }
        
        
        if kgtolb.selectedSegmentIndex == 0 {
            let met = MET[w]!
            let weight = Double(weigh)
            let tot = (weight! * Double(t) * Double(met))/60
            
            caloriText.text = String(tot.rounded()) + "kcal"

        }
        else {
            let met = MET[w]!
            var weight = Double(weigh)
            weight = weight! / 2.23
            let tot = (weight! * Double(t) * Double(met))/60
            caloriText.text = String(tot.rounded()) + "kcal"

        }
        
        
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 2
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           if component == workouttype {
               return workouttypes.count
           }
           else {
               return times.count
           }
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           if component == workouttype {
               return String(workouttypes[row])
           }
           else {
               return String(times[row])
           }
       }
    
    
    
    
    @IBAction func res(_ sender: Any) {
        weightText.resignFirstResponder()
        caloriText.resignFirstResponder()
    }
    
    
    

}
