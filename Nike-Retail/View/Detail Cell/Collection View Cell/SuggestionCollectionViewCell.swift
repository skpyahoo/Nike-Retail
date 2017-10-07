//
//  SuggestionCollectionViewCell.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 07/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class SuggestionCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    
    var image: UIImage! {
    
        didSet {
            imageView.image = image
            setNeedsLayout()
        }
    
    
    }
    
}
