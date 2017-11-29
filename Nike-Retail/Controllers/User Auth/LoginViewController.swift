//
//  LoginViewController.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 13/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.isEnabled = false
        loginButton.alpha = 0.2
        activityIndicator.alpha = 0.0
        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    
    @IBAction func isFormValid(_ sender: Any) {
        
        let isFormValid = emailTextField.text?.count ?? 0 > 0 &&
            passwordTextField.text?.count ?? 0 > 5
        
        
        if isFormValid {
            loginButton.isEnabled = true
            loginButton.alpha = 1.0
        }
        else
        {
            loginButton.isEnabled = false
            loginButton.alpha = 0.2
            
        }
        
    }
    
    func alert(title: String, message: String, buttonTitle: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        guard let email = emailTextField.text,email.count > 0 else {return}
        guard let password = passwordTextField.text,password.count > 0 else {return}
        
        activityIndicator.alpha = 1.0
        activityIndicator.startAnimating()
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, err) in
            if let err = err
            {
                print("Failed to Autheticate the new user",err)
                self.activityIndicator.stopAnimating()
                self.alert(title: "Oops!", message: err.localizedDescription, buttonTitle: "OK")
                return
            }
            print("Successfully Signed in")
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
            
        })
        
    }
}


extension LoginViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            loginButtonPressed(AnyObject.self)
        }
        
        return true
    }
}

