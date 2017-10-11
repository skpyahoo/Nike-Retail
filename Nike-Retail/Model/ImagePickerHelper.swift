//
//  ImagePickerHelper.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 11/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit
import MobileCoreServices

typealias ImagePickerHelperCompletion = ((UIImage?) -> Void)!

class ImagePickerHelper: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    // actionsheet, imagePickerController ==> viewController
    weak var viewController: UIViewController!
    var completion: ImagePickerHelperCompletion
    var profileImage: UIImage?
    
    init(viewController: UIViewController, completion: ImagePickerHelperCompletion) {
        self.viewController = viewController
        self.completion = completion
        
        super.init()
        
        self.showPhotoSourceSelection()
    }
    
    func showPhotoSourceSelection()
    {
        let actionSheet = UIAlertController(title: "Pick New Photo", message: "Would you like to open photos library or camera", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.showImagePicker(sourceType: .camera)
        })
        let photosLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in
            self.showImagePicker(sourceType: .photoLibrary)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photosLibraryAction)
        actionSheet.addAction(cancelAction)
        
        viewController.present(actionSheet, animated: true, completion: nil)
    }
    
    func showImagePicker(sourceType: UIImagePickerControllerSourceType)
    {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = sourceType
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.delegate = self
        
        viewController.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        {
            profileImage = editedImage
        }
        else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            profileImage = originalImage
        }
        
        viewController.dismiss(animated: true, completion: nil)
        completion(profileImage)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    
    
}

