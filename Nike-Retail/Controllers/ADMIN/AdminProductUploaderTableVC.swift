//
//  AdminProductUploaderTableVC.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 29/11/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit
import DKImagePickerController
import Photos

class AdminProductUploaderTableVC: UITableViewController {

    @IBOutlet var nextBarBtnItem: UIBarButtonItem!
    
    struct Storyboard {
        static let ProductUploaderCell = "ProductUploaderCell"
        static let productUploadInfo = "productUploadInfo"
    }
    
    var images: [UIImage]?
    var assets: [DKAsset]?
    var pickerController: DKImagePickerController!
    var productDict: [String:Any]?
    var prdName = String()
    var pickerValue = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 70.0
        tableView.rowHeight = UITableViewAutomaticDimension
        nextBarBtnItem.isEnabled = false
        
    }
    
   
    
    @IBAction func nextBarBtnPressed(_ sender: Any) {
        
        tableView.reloadData()
        
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ProductUploaderCell) as! ProductUploaderCell
        
        guard let prdName = cell.productNameTxtField.text else {return}
        self.prdName = prdName
        pickerValue = cell.selectedPickerValue ?? "Purses"
        print("Picker Value:\(pickerValue)")
        print("Product Name:\(prdName)")
        
       
        
        if prdName.count < 3
        {
            let alertVC = UIAlertController(title: "OPPS!!", message: "Please enter Product Name", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertVC.addAction(action)
            present(alertVC, animated: true, completion: nil)
        }
        else
        {
            self.productDict = ["Name": self.prdName, "Category": pickerValue]
            performSegue(withIdentifier: Storyboard.productUploadInfo, sender: nil)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Storyboard.productUploadInfo {
            if let productDetailTVC = segue.destination as? AdminSaveUploaderTableVC {
                productDetailTVC.images = images
                productDetailTVC.productDict = productDict
            }
        }
    }
    
    @IBAction func openAlbum(_ sender: Any) {
        
        let pickerController = DKImagePickerController()
        pickerController.assetType = .allPhotos
        
        
        pickerController.defaultSelectedAssets = self.assets
        
        pickerController.didSelectAssets = { [unowned self] (assets: [DKAsset]) in
            self.updateAssets(assets: assets)
            //  self.pickerController.defaultSelectedAssets = assets
        }
        
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func updateAssets(assets: [DKAsset]) {
        print("didSelectAssets")
        
        self.assets = assets
        
        assetToImageConvert()
        
    }
    
    fileprivate func assetToImageConvert()
    {
        //print("assets Count:",assets?.count)
        var images = [UIImage]()
        
        
        guard let assets = assets else {return}
        //let layout = ProductPageViewController.accessibilityFrame()
        let targetSize = CGSize(width: 700, height: 700)
        
        for asset in assets
        {
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            asset.fetchImageWithSize(targetSize, options: options, completeBlock: { (image, info) in
                
                guard let image = image else {return}
                //print(image)
                images.append(image)
                
            })
            
        }
        self.images = images
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ProductUploaderCell, for: indexPath) as! ProductUploaderCell
        if let images = images
        {
            cell.uploadedImage.image = images[0]
            nextBarBtnItem.isEnabled = true
        }

        if prdName.count > 0
        {
            cell.productNameTxtField.text = prdName
        }
        
        
        
       
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    

}
