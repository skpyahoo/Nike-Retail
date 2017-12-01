//
//  AdminProductImageVC.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 01/12/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class AdminProductImageVC: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var image: UIImage? {
        
        didSet {
            self.imageView?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = image
    }

    

}
