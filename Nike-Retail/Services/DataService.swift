//
//  DataService.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 11/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import Firebase

let ROOT_DB = Database.database().reference()
let ROOT_STORAGE = Storage.storage().reference()

class DataService
{
    static let ds = DataService()
    
    private var _ROOT_REF = ROOT_DB
    private var _ROOT_USER = ROOT_DB.child("users")
    
    private var _STORAGE_PROFILE_IMAGE = ROOT_STORAGE.child("profile-images")
    private var _ROOT_STORAGE_REF = ROOT_STORAGE
    
    var ROOT_REF: DatabaseReference
    {
        return _ROOT_REF
    }
    
    var ROOT_USER: DatabaseReference
    {
        return _ROOT_USER
    }
    
    var STORAGE_PROFILE_IMAGE: StorageReference
    {
        return _STORAGE_PROFILE_IMAGE
    }
    
    var ROOT_STORAGE_REF: StorageReference
    {
        return _ROOT_STORAGE_REF
    }
    
}

