//
//  WelcomeViewController.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 13/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        
        if Auth.auth().currentUser != nil
        {
            DispatchQueue.main.async {
                self.dismiss(animated: false, completion: nil)

            }
            return
        }
    }
    
    

}
