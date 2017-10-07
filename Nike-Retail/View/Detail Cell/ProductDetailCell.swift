//
//  ProductDetailCell.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 06/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class ProductDetailCell: UITableViewCell {

    @IBOutlet var productNameLabel: UILabel!
    
    @IBOutlet var productDescriptionLabel: UILabel!
    
    var product: Product? {
        didSet {
            productNameLabel.text = product?.name
            productDescriptionLabel.text = product?.description
        }
    }
    
}
