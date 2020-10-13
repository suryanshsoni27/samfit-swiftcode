//
//  File.swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/12/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import Foundation

struct Constants {
    static var API_KEY = "put your API Key here"
    //PLQiGxGHwiuD1v-WqWvbU8XDW4HOk2C1Na
    static var PLAYLIST_ID = "PLQiGxGHwiuD1v-WqWvbU8XDW4HOk2C1Na"
        static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=100&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "cell"
    static var YT_URL = "https://www.youtube.com/embed/"
    
}


