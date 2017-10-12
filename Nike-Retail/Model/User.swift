//
//  User.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 11/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class User
{
    var username: String
    let uid: String
    var fullName: String
    var profileImage: UIImage?
    var email: String
    var profileImageUrl: String?
    
    init(uid: String, username: String, fullName: String, profileImage: UIImage, email: String) {
        
        self.uid = uid
        self.username = username
        self.profileImage = profileImage
        self.fullName = fullName
        self.email = email
    }
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
    
    func save(completion: @escaping (Error?) -> Void) {
        
        let ref = DataService.ds.ROOT_USER.child(uid)
        
        if let profileImage = self.profileImage //,profileImage != #imageLiteral(resourceName: "icon-defaultAvatar")
        {
            let firImage = FIRImage(image: profileImage)
            firImage.saveProfileImage(uid, { imageUrl, err  in
                
                if let imageUrl = imageUrl
                {
                    print("Image URL:", imageUrl)
                    self.profileImageUrl = imageUrl
                    ref.setValue(self.toDictionary())
                }
                print("Successfully uploaded the image")
                
                completion(err)
                
                
            })
        }
        
        
        
        
    }
    
    func toDictionary() -> [String: Any]
    {
        return ["uid": uid,
                "username": username,
                "fullName": fullName,
                "email": email,
                "profileImageUrl": profileImageUrl!
        ]
        
    }
    
}
