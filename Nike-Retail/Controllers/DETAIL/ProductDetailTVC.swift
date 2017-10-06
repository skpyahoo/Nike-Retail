//
//  ProductDetailTVC.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 06/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class ProductDetailTVC: UITableViewController {
    
    var product: Product!
    
    struct Storyboard {
        
        static let productDetailCell = "ProductDetailCell"
        static let buyButtonCell = "BuyButtonCell"
        static let showProductDetailCell = "ShowProductDetailCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = product.name
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension

    }

   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    fileprivate func extractedFunc() -> UITableViewCell {
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.productDetailCell, for: indexPath) as! ProductDetailCell
            
            cell.product = product
            cell.selectionStyle = .none
            
            return cell
            
        } else if indexPath.row == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.buyButtonCell, for: indexPath) as! BuyButtonCell
            
            cell.product = product
            cell.selectionStyle = .none
            
            return cell
            
        } else if indexPath.row == 2
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.showProductDetailCell, for: indexPath)
             cell.selectionStyle = .none
            
            return cell
            
        }
        else
        {
            return extractedFunc()
            
        }
    }
    
    
   

}
