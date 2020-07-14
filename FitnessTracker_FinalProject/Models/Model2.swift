//
//  Model2.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/13/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import Foundation

protocol ModelDelegate2 {
    func videosFetched(_ videos:[Video])
}


class Model2 {
    var delegate:ModelDelegate2?
    
    func getVideos() {
        let url = URL(string: Constants2.API_URL)
        guard url != nil else{
            return
        }
    
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
      
            if error != nil || data == nil {
                return
            }
            
            do {
                
              
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        
                     
                        self.delegate?.videosFetched(response.items!)
                    }}}
            catch {
                
            }}
        
        dataTask.resume()
        
    }}
