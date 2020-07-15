//
//  yogaViewController.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/13/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import UIKit

class yogaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPickerViewDelegate,UIPickerViewDataSource {
    
    var images = 1...10
    let typeyoga = ["Arm balance poses", "Balancing poses","Binding poses","Chest opening poses","Core poses","Forward bending poses","Hip opening poses"]
//     let typeyoga = ["Arm balance poses", "Balancing poses","Binding poses","Chest opening poses","Core poses","Forward bending poses","Hip opening poses","Pranyam","Strengthening poses","twist yoga","Seated yoga", "restorative yoga","Standing yoga poses","Yoga bandha"]
    @IBOutlet weak var yogaPicke: UIPickerView!
    
    @IBOutlet weak var collection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 240, height: 240)
        collection.collectionViewLayout = layout
        
        
        
        
        collection.register(yogaimageCollectionViewCell.nib(), forCellWithReuseIdentifier: yogaimageCollectionViewCell.identifier)
        collection.delegate = self
        collection.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func showPoseButton(_ sender: Any) {
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        typeyoga.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeyoga[row]}

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: yogaimageCollectionViewCell.identifier, for: indexPath) as! yogaimageCollectionViewCell
              cell.configure(with: UIImage(named: "thirdpic")!)
              return cell

    }
    
    

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 240)
    }
}

