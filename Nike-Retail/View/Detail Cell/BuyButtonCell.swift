//
//  BuyButtonCell.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 06/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class BuyButtonCell: UITableViewCell {

    @IBOutlet var buyButton: UIButton!
    
    var product: Product! {
        
        didSet {
            buyButton.setTitle("BUY FOR ₹\(product!.price!)", for: .normal)
        }
    }
    

}
