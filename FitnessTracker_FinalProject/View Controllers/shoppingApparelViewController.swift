//
//  shoppingApparelViewController.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/15/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit
import SafariServices
class shoppingApparelViewController: UIViewController {
    
    
    
    @IBOutlet weak var gymShark: UIButton!
    @IBOutlet weak var nike: UIButton!
    @IBOutlet weak var addidas: UIButton!
    
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
    
    
    @IBAction func gymsharkbut(_ sender: Any) {
        showSafariVC(for: "https://www.gymshark.com/")
    }
    
    
    @IBAction func nikebut(_ sender: Any) {
        showSafariVC(for: "https://www.nike.com/")
    }
    
    @IBAction func underarmour(_ sender: Any) {
        showSafariVC(for: "https://www.underarmour.com/")
    }
    
    
    
    func showSafariVC(for url:String) {
        guard let url = URL(string: url) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC,animated: true)
    }
    
    
}
