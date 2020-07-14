//
//  PowerliftDetailViewController.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/13/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit
import WebKit
class PowerliftDetailViewController: UIViewController {
    
    
       @IBOutlet weak var titleLab: UILabel!
       @IBOutlet weak var dateLab: UILabel!
       
       @IBOutlet weak var webView: WKWebView!
       
       @IBOutlet weak var textView: UITextView!
       
       
       var video:Video?
       
       
       override func viewDidLoad() {
           
           super.viewDidLoad()

           // Do any additional setup after loading the view.
       }
       
       override func viewWillAppear(_ animated: Bool) {
           titleLab.text = ""
           dateLab.text = ""
           textView.text = ""
           guard video != nil else {
               return
           }
           let embedUrl = Constants.YT_URL + video!.videoId
           
           let url = URL(string: embedUrl)
           let request = URLRequest(url: url!)
           webView.load(request)
           
           titleLab.text = video!.title
           
            let df = DateFormatter()
           df.dateFormat = "EEEE, MMM d, yyyy"
           self.dateLab.text = df.string(from: video!.published)
           
           
           textView.text = video!.description

       }
       

}
