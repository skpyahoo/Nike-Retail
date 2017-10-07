//
//  ShoppingCartItemCell.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 07/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class ShoppingCartItemCell: UITableViewCell {

    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var removeButton: UIButton!
    
    var product: Product! {
        didSet {
            
            updateUI()
        }
    }
    
    func updateUI()
    {
        productImageView.image = product.images?.first
        productNameLabel.text = product.name
        priceLabel.text = "₹\(product.price!)"
    }
    
}
