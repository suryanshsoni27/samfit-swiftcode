//
//  PowerliftViewController.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/13/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class PowerliftViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var type = ["General","upper","lower"]
    
    
    
    @IBOutlet weak var weighText: UITextField!
    @IBOutlet weak var repsText: UITextField!
    @IBOutlet weak var kgtolbControl: UISegmentedControl!
    @IBOutlet weak var hundRm: UILabel!
    @IBOutlet weak var ninetyRm: UILabel!
    @IBOutlet weak var seventyRm: UILabel!
    @IBOutlet weak var eightyRm: UILabel!
    @IBOutlet weak var sixtyRM: UILabel!
    @IBOutlet weak var fiftyRm: UILabel!
    @IBOutlet weak var fortyRm: UILabel!
    
    
    @IBOutlet weak var youcan: UILabel!
    
    @IBOutlet weak var repLab: UILabel!
    
    
    @IBOutlet weak var calBut: UIButton!
    
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Utilities.buttonStyle(calBut)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    @IBAction func calculateButton(_ sender: Any) {
        let choice = kgtolbControl.selectedSegmentIndex
        let row = picker.selectedRow(inComponent: 0)
        let selected = type[row]
        
        if selected == "upper" {
//            repLab.alpha = CGFloat(0.0)
//            repsText.alpha = CGFloat(0.0)
//            youcan.alpha = CGFloat(1.0)
            let controller = UIAlertController(title:"Are you sure yo want to use these values?",message: nil,preferredStyle: .actionSheet)
            let yesAction = UIAlertAction(title: "sure", style: .destructive,
                                          handler:{ action in
                                            
                                            
                                            guard let w = self.weighText.text, w != "" else {
                                                let controller = UIAlertController (title:"You did enter anything",message: nil, preferredStyle: .alert)
                                                let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                                controller.addAction(cancelAction)
                                                self.present(controller,animated: true,completion: nil)
                                                return
                                            }
                                            guard self.weighText.text != nil , let callw = Double(self.weighText.text!), callw >= 0.0 else{
                                                let controller = UIAlertController (title:"values not provided",message: nil, preferredStyle: .alert)
                                                let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                                controller.addAction(cancelAction)
                                                self.present(controller,animated: true,completion: nil)
                                                return
                                                
                                            }
                                            
//                                            guard let r = self.repsText.text, r != "" else {
//                                                let controller = UIAlertController (title:"You did enter anything",message: nil, preferredStyle: .alert)
//                                                let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
//                                                controller.addAction(cancelAction)
//                                                self.present(controller,animated: true,completion: nil)
//                                                return
//                                            }
//                                            guard self.repsText.text != nil , let callr = Double(self.repsText.text!), callr >= 0.0 else{
//                                                let controller = UIAlertController (title:"values not provided",message: nil, preferredStyle: .alert)
//                                                let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
//                                                controller.addAction(cancelAction)
//                                                self.present(controller,animated: true,completion: nil)
//                                                return}
                                            
                                            let weight = Double(w)
                                           
                                            let hund = (weight!*(1.1307)) + 0.6998
                                            
                                            self.hundRm.text = "100% " + String(hund.rounded() ) + self.kgtolbControl.titleForSegment(at: choice)!  + " 1 rep"
                                            self.ninetyRm.text = "90% " + String((hund*0.90).rounded()) + self.kgtolbControl.titleForSegment(at: choice)!  + " 2 reps"
                                            self.eightyRm.text = "80% " +  String((hund*0.80).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 4 reps"
                                            self.seventyRm.text = "70% " +  String((hund*0.70).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 6 reps"
                                            self.sixtyRM.text = "60% " + String((hund*0.60).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 8 reps"
                                            self.fiftyRm.text = "50% " + String((hund*0.50).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 10 reps"
                                            self.fortyRm.text = "40% " + String((hund*0.40).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 12 reps"
                                            
                                            
            })
            
            let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
            controller.addAction(yesAction)
            controller.addAction(noAction)
            
            
            present(controller,animated: true,completion: nil)
            
        }
        else if selected == "lower"{
//            repLab.alpha = CGFloat(0.0)
//            repsText.alpha = CGFloat(0.0)
//            youcan.alpha = CGFloat(1.0)
             let controller = UIAlertController(title:"Are you sure yo want to use these values?",message: nil,preferredStyle: .actionSheet)
                       let yesAction = UIAlertAction(title: "sure", style: .destructive,
                                                     handler:{ action in
                                                       
                                                       
                                                       guard let w = self.weighText.text, w != "" else {
                                                           let controller = UIAlertController (title:"You did enter anything",message: nil, preferredStyle: .alert)
                                                           let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                                           controller.addAction(cancelAction)
                                                           self.present(controller,animated: true,completion: nil)
                                                           return
                                                       }
                                                       guard self.weighText.text != nil , let callw = Double(self.weighText.text!), callw >= 0.0 else{
                                                           let controller = UIAlertController (title:"check values for spaces or some other characters",message: nil, preferredStyle: .alert)
                                                           let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                                           controller.addAction(cancelAction)
                                                           self.present(controller,animated: true,completion: nil)
                                                           return
                                                           
                                                       }
                                                       
//                                                       guard let r = self.repsText.text, r != "" else {
//                                                           let controller = UIAlertController (title:"You did enter anything",message: nil, preferredStyle: .alert)
//                                                           let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
//                                                           controller.addAction(cancelAction)
//                                                           self.present(controller,animated: true,completion: nil)
//                                                           return
//                                                       }
//                                                       guard self.repsText.text != nil , let callr = Double(self.repsText.text!), callr >= 0.0 else{
//                                                           let controller = UIAlertController (title:"check values for spaces or some other characters",message: nil, preferredStyle: .alert)
//                                                           let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
//                                                           controller.addAction(cancelAction)
//                                                           self.present(controller,animated: true,completion: nil)
//                                                           return}
                                                       
                                                       let weight = Double(w)
                                                      
                                                        let hund = (weight!*(1.09703)) + 14.2546
                                                             self.hundRm.text = "100% " + String(hund.rounded() ) + self.kgtolbControl.titleForSegment(at: choice)!  + " 1 rep"
                                                                                                       self.ninetyRm.text = "90% " + String((hund*0.90).rounded()) + self.kgtolbControl.titleForSegment(at: choice)!  + " 2 reps"
                                                                                                       self.eightyRm.text = "80% " +  String((hund*0.80).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 4 reps"
                                                                                                       self.seventyRm.text = "70% " +  String((hund*0.70).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 6 reps"
                                                                                                       self.sixtyRM.text = "60% " + String((hund*0.60).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 8 reps"
                                                                                                       self.fiftyRm.text = "50% " + String((hund*0.50).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 10 reps"
                                                                                                       self.fortyRm.text = "40% " + String((hund*0.40).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 12 reps"
                                                                                             
                                                       
                                                       
                       })
                       
                       let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
                       controller.addAction(yesAction)
                       controller.addAction(noAction)
                       
                       
                       present(controller,animated: true,completion: nil)
            
        }
        
        else if selected == "general" {
//
//            repLab.alpha = CGFloat(1.0)
//            repsText.alpha = CGFloat(1.0)
//            youcan.alpha = CGFloat(0.0)
             let controller = UIAlertController(title:"Are you sure yo want to use these values?",message: nil,preferredStyle: .actionSheet)
                       let yesAction = UIAlertAction(title: "sure", style: .destructive,
                                                     handler:{ action in
                                                       
                                                       
                                                       guard let w = self.weighText.text, w != "" else {
                                                           let controller = UIAlertController (title:"You did enter anything",message: nil, preferredStyle: .alert)
                                                           let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                                           controller.addAction(cancelAction)
                                                           self.present(controller,animated: true,completion: nil)
                                                           return
                                                       }
                                                       guard self.weighText.text != nil , let callw = Double(self.weighText.text!), callw >= 0.0 else{
                                                           let controller = UIAlertController (title:"check values for spaces or some other characters",message: nil, preferredStyle: .alert)
                                                           let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                                           controller.addAction(cancelAction)
                                                           self.present(controller,animated: true,completion: nil)
                                                           return
                                                           
                                                       }
                                                       
                                                       guard let r = self.repsText.text, r != "" else {
                                                           let controller = UIAlertController (title:"You did enter anything",message: nil, preferredStyle: .alert)
                                                           let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                                           controller.addAction(cancelAction)
                                                           self.present(controller,animated: true,completion: nil)
                                                           return
                                                       }
                                                       guard self.repsText.text != nil , let callr = Double(self.repsText.text!), callr >= 0.0 else{
                                                           let controller = UIAlertController (title:"check values for spaces or some other characters",message: nil, preferredStyle: .alert)
                                                           let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                                           controller.addAction(cancelAction)
                                                           self.present(controller,animated: true,completion: nil)
                                                           return}
                                                       
                                                       let weight = Double(w)
                                                       let reps = Double(r)
                                                       let hund = weight!*(1 + reps!/30)
                                                             self.hundRm.text = "100% " + String(hund.rounded() ) + self.kgtolbControl.titleForSegment(at: choice)!  + " 1 rep"
                                                                                                       self.ninetyRm.text = "90% " + String((hund*0.90).rounded()) + self.kgtolbControl.titleForSegment(at: choice)!  + " 2 reps"
                                                                                                       self.eightyRm.text = "80% " +  String((hund*0.80).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 4 reps"
                                                                                                       self.seventyRm.text = "70% " +  String((hund*0.70).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 6 reps"
                                                                                                       self.sixtyRM.text = "60% " + String((hund*0.60).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 8 reps"
                                                                                                       self.fiftyRm.text = "50% " + String((hund*0.50).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 10 reps"
                                                                                                       self.fortyRm.text = "40% " + String((hund*0.40).rounded()) + self.kgtolbControl.titleForSegment(at: choice)! + " 12 reps"
                                                                                             
                                                       
                                                       
                       })
                       
                       let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
                       controller.addAction(yesAction)
                       controller.addAction(noAction)
                       
                       
                       present(controller,animated: true,completion: nil)
            
            
            
            
            
        }
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type[row]}
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = type[row]
        
        if selected == "general" {
            
            repLab.alpha = CGFloat(1.0)
            repsText.alpha = CGFloat(1.0)
            youcan.alpha = CGFloat(0.0)
        }
        else if selected == "upper" {
            repLab.alpha = CGFloat(0.0)
            repsText.alpha = CGFloat(0.0)
            youcan.alpha = CGFloat(1.0)
        }
        else if selected == "lower" {
            repLab.alpha = CGFloat(0.0)
            repsText.alpha = CGFloat(0.0)
            youcan.alpha = CGFloat(1.0)
            
        }
        reloadInputViews()
        picker.reloadAllComponents()
        
    }
    
    
    @IBAction func weigtres(_ sender: Any) {
        weighText.resignFirstResponder()
    }
    
    @IBAction func repres(_ sender: Any) {
        repsText.resignFirstResponder()
    }
    
    
    
    @IBAction func tapGest(_ sender: Any) {
        repsText.resignFirstResponder()
         weighText.resignFirstResponder()
    }
    
    
}
