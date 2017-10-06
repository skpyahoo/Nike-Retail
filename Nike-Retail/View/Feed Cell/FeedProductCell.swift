//
//  FeedProductCell.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 06/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class FeedProductCell: UITableViewCell {
    
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productPriceLabel: UILabel!
    
    var product: Product?
    {
        didSet {
            updateUI()
        }
    }
    
    func updateUI()
    {
        guard let product = product else {return}
        
        productImageView.image = product.images?.first
        productNameLabel.text = product.name
        productPriceLabel.text = "\(product.price!)"
        
    }

}
