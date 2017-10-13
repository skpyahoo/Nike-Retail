//
//  SignupViewController.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 11/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {

    @IBOutlet var profileImageButton: UIButton!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var fullNameTextField: UITextField!
    @IBOutlet var createNewAccountButton: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var imagePickerHelper: ImagePickerHelper!
    var profileImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createNewAccountButton.isEnabled = false
        createNewAccountButton.alpha = 0.2
        activityIndicator.alpha = 0.0
        
        
    }

    @IBAction func createNewAccountPressed(_ sender: Any) {
        
        guard let email = emailTextField.text,email.characters.count > 0 else {return}
        guard let username = usernameTextField.text,username.characters.count > 0 else {return}
        guard let fullname = fullNameTextField.text,fullname.characters.count > 0 else {return}
        guard let profileImage = profileImage else {return}
        guard let password = passwordTextField.text,password.characters.count > 0 else {return}
        
        activityIndicator.alpha = 1.0
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, err) in
            
            if let err = err
            {
                print("Can't create a user",err)
                
                self.activityIndicator.stopAnimating()
                return
            }
            guard let uid = user?.uid else {return}
            
            let newUser = User(uid: uid, username: username, fullName: fullname, profileImage: profileImage, email: email)
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, err) in
                if let err = err
                {
                    print("Failed to Autheticate the new user",err)
                    self.activityIndicator.stopAnimating()
                    return
                }
                newUser.save(completion: { (err) in
                    
                    if let err = err
                    {
                        print("Error in saving new user",err)
                        self.activityIndicator.stopAnimating()
                        return
                    }
                    else
                    {
                        self.activityIndicator.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
                
            })
            
            
            
            
            
            
        }
        
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
            passwordTextField.text?.characters.count ?? 0 > 5 &&
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
