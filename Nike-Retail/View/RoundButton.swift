//
//  RoundButton.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 11/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

override func layoutSubviews() {
    
    super.layoutSubviews()
    
    layer.cornerRadius = self.frame.width / 2
    layer.masksToBounds = true
    layer.borderColor = UIColor.white.cgColor
    layer.borderWidth = 3
}


}

