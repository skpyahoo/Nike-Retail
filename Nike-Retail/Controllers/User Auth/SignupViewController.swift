//
//  SignupViewController.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 11/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet var profileImageButton: UIButton!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var fullNameTextField: UITextField!
    @IBOutlet var createNewAccountButton: UIButton!
    
    var imagePickerHelper: ImagePickerHelper!
    var profileImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createNewAccountButton.isEnabled = false
        createNewAccountButton.alpha = 0.2
        
        
    }

    @IBAction func createNewAccountPressed(_ sender: Any) {
    }
    
    @IBAction func changeProfileImageBtnDidTap(_ sender: Any) {
        
        imagePickerHelper = ImagePickerHelper(viewController: self, completion: { (image) in
            
            guard let image = image else {return}
            self.profileImageButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            self.profileImage = image
        })
    }
    
    
    
    @IBAction func isFormvalid(_ sender: Any) {
        
        
        let isFormValid = emailTextField.text?.characters.count ?? 0 > 0 &&
            usernameTextField.text?.characters.count ?? 0 > 0 &&
            passwordTextField.text?.characters.count ?? 0 > 0 &&
            fullNameTextField.text?.characters.count ?? 0 > 0
        
        if isFormValid {
            createNewAccountButton.isEnabled = true
            createNewAccountButton.alpha = 1.0
        }
        else
        {
            createNewAccountButton.isEnabled = false
            createNewAccountButton.alpha = 0.2
            
        }
    }
    
}
