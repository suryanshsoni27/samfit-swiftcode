//
//  CalorrieTrackerViewController.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/8/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class CalorrieTrackerViewController: UIViewController {
    
    fileprivate static let rootKey = "rootKey"
    @IBOutlet var lineFields:[UITextField]!
    
    //MARK: outlets defined
    @IBOutlet weak var caloriesInput: UITextField!
    @IBOutlet weak var carbInput: UITextField!
    @IBOutlet weak var proteinInput: UITextField!
    @IBOutlet weak var FatsInput: UITextField!
    @IBOutlet weak var choiceOutlet: UISegmentedControl!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var multinputText: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var kgtolb: UISegmentedControl!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    
    
    
    @IBOutlet weak var callab: UILabel!
    func changeTexture() {
        callab.layer.cornerRadius = 8.0
        callab.layer.cornerRadius = 1000
    }
    
    
    
    
    override func viewDidLoad() {
        changeTexture()
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        Utilities.buttonStyle(calculateButton)
        let fileURL = self.dataFileURL()
        if (FileManager.default.fileExists(atPath: fileURL.path!)) {
            if let array = NSArray(contentsOf: fileURL as URL) as? [String]{
                for i in 0..<array.count {
                    lineFields[i].text = array[i]
                }
            }
        }
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(notification:)), name: UIApplication.willResignActiveNotification, object: app)
        
    }
    
    
    
   // Set the shouldAutorotate to False
   
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    //MARK: ibactions for increment fields
    @IBAction func caloriePlus(_ sender: Any) {
        
        
        let controller = UIAlertController(title:"Are you sure yo want to use these values?",message: nil,preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "sure", style: .destructive, handler:{ action in
            guard let cal = self.multinputText.text, cal != "" else {
                let controller = UIAlertController (title:"You did not enter anything",message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                controller.addAction(cancelAction)
                self.present(controller,animated: true,completion: nil)
                return
            }
            guard self.multinputText.text != nil , let call = Double(self.multinputText.text!), call >= 0.0 else{
                let controller = UIAlertController (title:"Not valid Calorie",message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                controller.addAction(cancelAction)
                self.present(controller,animated: true,completion: nil)
                return}
            
            var first = Double(self.caloriesInput.text!)
            if first == nil {
                first = 0.0
            }
            let second = Double(self.multinputText.text!)
            var sum = 0.0
            sum = first! + second!
            self.caloriesInput.text = String(sum)})
        
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender as? UIView
            ppc.sourceRect = (sender as AnyObject).bounds
            ppc.permittedArrowDirections = .down
        }
        present(controller,animated:true, completion: nil)
    }
    //MARK: ibactions for increment fields
    @IBAction func carbPlus(_ sender: Any) {
        let controller = UIAlertController(title:"Are you sure yo want to use these values?",message: nil,preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "sure", style: .destructive, handler:{ action in
            guard let cal = self.multinputText.text, cal != "" else {
                let controller = UIAlertController (title:"You did not enter anything",message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                controller.addAction(cancelAction)
                self.present(controller,animated: true,completion: nil)
                return
            }
            guard self.multinputText.text != nil , let call = Double(self.multinputText.text!), call >= 0.0 else{
                let controller = UIAlertController (title:"Not valid Carbohydrate value",message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                controller.addAction(cancelAction)
                self.present(controller,animated: true,completion: nil)
                return}
            
            var first = Double(self.carbInput.text!)
            if first == nil {
                first = 0.0
            }
            let second = Double(self.multinputText.text!)
            var sum = 0.0
            sum = first! + second!
            self.carbInput.text = String(sum)})
        
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender as? UIView
            ppc.sourceRect = (sender as AnyObject).bounds
            ppc.permittedArrowDirections = .down
        }
        present(controller,animated:true, completion: nil)
        
    }
    //MARK: ibactions for increment fields
    @IBAction func protPlus(_ sender: Any) {
        let controller = UIAlertController(title:"Are you sure yo want to use these values?",message: nil,preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "sure", style: .destructive, handler:{ action in
            guard let cal = self.multinputText.text, cal != "" else {
                let controller = UIAlertController (title:"You did not enter anything",message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                controller.addAction(cancelAction)
                self.present(controller,animated: true,completion: nil)
                return
            }
            guard self.multinputText.text != nil , let call = Double(self.multinputText.text!), call >= 0.0 else{
                let controller = UIAlertController (title:"Not valid Protein value",message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                controller.addAction(cancelAction)
                self.present(controller,animated: true,completion: nil)
                return}
            
            var first = Double(self.proteinInput.text!)
            if first == nil {
                first = 0.0
            }
            let second = Double(self.multinputText.text!)
            var sum = 0.0
            sum = first! + second!
            self.proteinInput.text = String(sum)})
        
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender as? UIView
            ppc.sourceRect = (sender as AnyObject).bounds
            ppc.permittedArrowDirections = .down
        }
        present(controller,animated:true, completion: nil)
        
    }
    //MARK: ibactions for increment fields
    @IBAction func fatPlus(_ sender: Any) {
        let controller = UIAlertController(title:"Are you sure yo want to use these values?",message: nil,preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "sure", style: .destructive, handler:{ action in
            guard let cal = self.multinputText.text, cal != "" else {
                let controller = UIAlertController (title:"You did not enter anything",message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                controller.addAction(cancelAction)
                self.present(controller,animated: true,completion: nil)
                return
            }
            guard self.multinputText.text != nil , let call = Double(self.multinputText.text!), call >= 0.0 else{
                let controller = UIAlertController (title:"Not valid Fat value",message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                controller.addAction(cancelAction)
                self.present(controller,animated: true,completion: nil)
                return}
            
            var first = Double(self.FatsInput.text!)
            if first == nil {
                first = 0.0
            }
            let second = Double(self.multinputText.text!)
            var sum = 0.0
            sum = first! + second!
            self.FatsInput.text = String(sum)})
        
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender as? UIView
            ppc.sourceRect = (sender as AnyObject).bounds
            ppc.permittedArrowDirections = .down
        }
        present(controller,animated:true, completion: nil)
        
    }
    
    @IBAction func whatPressed(_ sender: Any) {
        let controller = UIAlertController(title:"Put numeric value and press plus button to add number in respective field. \n the sole purpose of this is to let you track your total calories for the day",message: nil,preferredStyle: .alert)
        let Action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        controller.addAction(Action)
        present(controller,animated:true, completion: nil)
    }
    
    
    
    
    
    //MARK: major IBfunc outlet
    @IBAction func calculateButton(_ sender: UIButton) {
        let controller = UIAlertController(title:"Are you sure yo want to use these values?",message: nil,preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "sure", style: .destructive,
                                      handler:{ action in
                                        
                                        
                                        guard let h = self.heightText.text, h != "" else {
                                            let controller = UIAlertController (title:"You did enter anything",message: nil, preferredStyle: .alert)
                                            let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                            controller.addAction(cancelAction)
                                            self.present(controller,animated: true,completion: nil)
                                            return
                                        }
                                        guard self.heightText.text != nil , let callh = Double(self.heightText.text!), callh >= 0.0 else{
                                            let controller = UIAlertController (title:"values not provided",message: nil, preferredStyle: .alert)
                                            let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                            controller.addAction(cancelAction)
                                            self.present(controller,animated: true,completion: nil)
                                            return
                                            
                                        }
                                        
                                        guard let a = self.ageText.text, a != "" else {
                                            let controller = UIAlertController (title:"You did not enter anything",message: nil, preferredStyle: .alert)
                                            let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                            controller.addAction(cancelAction)
                                            self.present(controller,animated: true,completion: nil)
                                            return
                                        }
                                        guard self.ageText.text != nil , let calla = Double(self.ageText.text!), calla >= 0.0 else{
                                            let controller = UIAlertController (title:"values not provided",message: nil, preferredStyle: .alert)
                                            let cancelAction = UIAlertAction(title:"Enter Again",style: .cancel ,handler: nil)
                                            controller.addAction(cancelAction)
                                            self.present(controller,animated: true,completion: nil)
                                            return}
                                        guard let w = self.weightText.text, w != "" else {
                                            let controller = UIAlertController (title:"You did not enter anything",message: nil, preferredStyle: .alert)
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
                                            return}
                                        
                                        

                                        let choice_Out = self.kgtolb.selectedSegmentIndex
                                        if choice_Out == 0 {
                                            
                                            let ww = Double(self.weightText.text!)
                                            let hh = Double(self.heightText.text!)
                                            let aa = Double(self.ageText.text!)
                                            var bmr = 0.0
                                            //TODO:- make alert view for nil values
                                            bmr = bmr + 13.397 * ww!
                                            bmr = bmr + 4.779 * hh!
                                            bmr = bmr - 5.67 * aa!
                                            bmr = bmr + 88.362
                                            bmr = bmr.rounded()
                                            if self.choiceOutlet.selectedSegmentIndex == 0 {
                                                let text = "You had \(self.caloriesInput.text! ) calories , \(self.carbInput.text! ) Carbohydrates, \(self.proteinInput.text! ) Protiens and \(self.FatsInput.text! ) Fats.\n \(bmr) is your BMR(Basal metabolic rate).\n In order to gain muscle and weight, you need to eat \n \t \(bmr + 300) to \(bmr + 500) calories"
                                                
                                                
                                                
                                
                                                self.textField.text = text
                                            }
                                            else if self.choiceOutlet.selectedSegmentIndex == 1 {
                                                let text = "You had \(self.caloriesInput.text! ) calories, \(self.carbInput.text! ) Carbohydrates, \(self.proteinInput.text! ) Protiens and \(self.FatsInput.text! ) Fats. \n \(bmr) is your BMR(Basal metabolic rate).\n In order to lose fat in a healthy way you need to eat\n \t \(bmr - 500) to \(bmr - 300) calories"
       
                                                self.textField.text = text
                                            }
                                            else {
                                                let text = "You had \(self.caloriesInput.text! ) calories, \(self.carbInput.text! ) Carbohydrates, \(self.proteinInput.text! ) Protiens and \(self.FatsInput.text! ) Fats. \n \(bmr) is your BMR(Basal metabolic rate).\n In order to maintian weight you need to eat \n \t \(bmr - 200) to \(bmr + 200) calories"
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                self.textField.text = text}
                                            
                                        }
                                        else if choice_Out == 1 {
                                            self.heightLabel.text = "fts"
                                            self.weightLabel.text = "lbs"

                                            let ww = Double(self.weightText.text!)
                                            let hh = Double(self.heightText.text!)
                                            let aa = Double(self.ageText.text!)
                                            let wu = ww! / 2.20
                                            let hu = hh! / 0.0328
                                            var bmr = 0.0
                                            bmr = bmr + 13.397 * wu
                                            bmr = bmr + 4.779 * hu
                                            bmr = bmr - 5.67 * aa!
                                            bmr = bmr + 88.362
                                            bmr = bmr.rounded()
                                            if self.choiceOutlet.selectedSegmentIndex == 0 {
                                                let text = "You had \(self.caloriesInput.text! ) calories, \(self.carbInput.text! ) Carbohydrates, \(self.proteinInput.text! ) Protiens and \(self.FatsInput.text! ) Fats.\n\(bmr) is your BMR(Basal metabolic rate).\nIn order to gain muslce and weight you need to eat \n \t \(bmr + 300) to \(bmr + 500) calories"
                                                self.textField.text = text
                                            }
                                            else if self.choiceOutlet.selectedSegmentIndex == 1 {
                                                let text = "You had \(self.caloriesInput.text! ) calories, \(self.carbInput.text! ) Carbohydrates, \(self.proteinInput.text! ) Protiens and \(self.FatsInput.text! ) Fats. \n\(bmr) is your BMR(Basal metabolic rate).\n In order to lose fat in good manner you need to eat\n \t \(bmr - 500) to \(bmr - 300) calories"
                                                self.textField.text = text
                                            }
                                            else {
                                                let text = "You had \(self.caloriesInput.text! ) calories, \(self.carbInput.text! ) Carbohydrates, \(self.proteinInput.text! ) Protiens and \(self.FatsInput.text! ) Fats. \n \(bmr) is your BMR(Basal metabolic rate).\n In order to maintian weight you need to eat \n \t \(bmr - 200) to \(bmr + 200) calories"
                                                self.textField.text = text}



                                        }})
        
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender as UIView
            ppc.sourceRect = (sender as AnyObject).bounds
            ppc.permittedArrowDirections = .down
        }
        
        present(controller,animated:true, completion: nil)
        
        
        
        
        
        
        
    }
    
    
    
    
    @IBAction func flipkgToLb(_ sender: Any) {
        if kgtolb.selectedSegmentIndex == 1 {
            weightLabel.text = "lbs"
            heightLabel.text = "fts"
        }
        else {
            weightLabel.text = "kg"
            heightLabel.text = "cm"
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    //MARK: resign responder
    @IBAction func calres(_ sender: Any) {caloriesInput.resignFirstResponder()}
    @IBAction func carbres(_ sender: Any) {carbInput.resignFirstResponder()}
    @IBAction func protres(_ sender: Any){proteinInput.resignFirstResponder()}
    @IBAction func fatres(_ sender: Any) {FatsInput.resignFirstResponder()}
    
    
    @IBAction func multires(_ sender: Any) {
        multinputText.resignFirstResponder()}
    
    @IBAction func heightres(_ sender: Any) {heightText.resignFirstResponder()}
    @IBAction func weightres(_ sender: Any) {weightText.resignFirstResponder()}
    @IBAction func ageres(_ sender: Any) {ageText.resignFirstResponder()}
    
    
    @IBAction func tapGest(_ sender: Any) {
        caloriesInput.resignFirstResponder()
        carbInput.resignFirstResponder()
        proteinInput.resignFirstResponder()
        FatsInput.resignFirstResponder()
        multinputText.resignFirstResponder()
        heightText.resignFirstResponder()
        weightText.resignFirstResponder()
        ageText.resignFirstResponder()
    }
    
    
    @objc func
        applicationWillResignActive(notification:NSNotification) {
        let fileURL = self.dataFileURL()
        let array = (self.lineFields as NSArray).value(forKey: "text") as! NSArray
        array.write(to: fileURL as URL, atomically: true)
    }
    
    
    func dataFileURL() -> NSURL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var url:NSURL?
        url = URL(fileURLWithPath: "") as NSURL?
        url = urls.first?.appendingPathComponent("data.archive") as NSURL?
        return url!
    }
    
    
    
    
    
    
    
}


