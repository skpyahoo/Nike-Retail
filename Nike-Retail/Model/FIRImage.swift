//
//  FIRImage.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 11/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit
import Firebase

class FIRImage
{
    var image: UIImage
    var downloadURL: URL?
    var downloadURLString: String!
    var ref: StorageReference!
    
    init(image: UIImage) {
        self.image = image
    }
    
    func saveProfileImage(_ userUID: String, _ completion: @escaping (Error?) -> Void) {
        
        let resizedImage = image.resize()
         if let imageData = UIImageJPEGRepresentation(resizedImage, 0.9)
         {
            // get the refernce
            
            ref = DataService.ds.STORAGE_PROFILE_IMAGE.child(userUID)
            downloadURLString = ref.description
            
            // save the data to the refernce
            ref.putData(imageData, metadata: nil, completion: { (metaData, err) in
                
                if let err = err
                {
                    print("Failed to upload image",err)
                    return
                }
                
                print("Successfully Uploade profile image to the Storage")
                
            })
            
        }
        
        
        
    }
    
}


private extension UIImage
{
    func resize() -> UIImage
    {
        let height: CGFloat = 1000.0
        let ratio = self.size.width / self.size.height
        let width = height * ratio
        
        let newSize = CGSize(width: width, height: height)
        let newRectangle = CGRect(x: 0, y: 0, width: width, height: height)
        
        //context canvas
        
        UIGraphicsBeginImageContext(newSize)
        
        //draw the newly sized image on the canvas
        
        self.draw(in: newRectangle)
        
        //get the new size image into a new rectangle
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        //close the canvas
        UIGraphicsEndImageContext()
        
        return resizedImage!
        
    }
}
