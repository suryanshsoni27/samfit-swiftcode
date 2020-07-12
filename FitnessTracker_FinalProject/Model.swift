//
//  Model.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/12/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import Foundation


class Model {
    
    func getVideos() {
        //Create URL object
        
        let url = URL(string: Constants.API_URL)
        guard url != nil else {
            return
        }
        //URLSesssion object
        
        let session = URLSession.shared
        //Get a Data tsk
        let dataTask  = session.dataTask(with: url!) { (data,response,error) in
            //
            if error != nil || data == nil {
                return
            }
            //parsing teh data
            
        }
        
        
        
        
        
        
        //Fire the task
        dataTask.resume()
        
    }
}
