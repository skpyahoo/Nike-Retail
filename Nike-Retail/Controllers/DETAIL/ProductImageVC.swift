//
//  ProductImageVC.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 06/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class ProductImageVC: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var image: UIImage? {
        
        didSet {
            self.imageView?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = image
        // Do any additional setup after loading the view.
    }

    
}
