//
//  imageSaver .swift
//  FitnessTracker_FinalProject
//
//  Created by Suryansh Soni on 7/28/20.
//  Copyright © 2020 Suryansh Soni. All rights reserved.
//

import Foundation
class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}
