//
//  ProductUploaderCell.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 29/11/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class ProductUploaderCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var uploadedImage: UIImageView!
    @IBOutlet var categoryPicker: UIPickerView!
    @IBOutlet var productNameTxtField: UITextField!
    @IBOutlet var productName: UILabel!
    
    var pickerData: [String] = [String]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self

        pickerData = ["Purses", "Bangales", "Jewellry", "Accessories"]
    
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
    }

}
