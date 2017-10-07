//
//  ShoppingBagTVC.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 07/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class ShoppingBagTVC: UITableViewController {
    
    var products: [Product]?
    
    struct Storyboard {
        static let numberOfItemsCell = "NumberOfItemsCell"
        static let shoppingCartItemCell = "ShoppingCartItemCell"
        static let cartDetailCell = "cartDetailCell"
        static let totalCell = "totalCell"
        static let checkoutButtonCell = "checkoutButtonCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        fetchProducts()
        
    }
    
    func fetchProducts()
    {
        products = Product.fetchProducts()
        tableView.reloadData()
    }


   

}




extension ShoppingBagTVC
{
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if let products = products
        {
            return products.count + 4
        }
        else{
            return 1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let products = products  else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemsCell
            
            cell.numberOfItemsLabel.text = "0 ITEM"
            return cell
        }
        
        if indexPath.row == 0
        {
            // no of items cell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemsCell
            
            cell.numberOfItemsLabel.text = products.count == 1 ? "\(products.count) ITEM" :"\(products.count) ITEMS"
            
            return cell
        }
        else if indexPath.row == products.count + 1
        {
            //cart price listings
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cartDetailCell, for: indexPath)
            
            return cell
            
        }
        else if indexPath.row == products.count + 2
        {
            // Cart Total Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.totalCell, for: indexPath)
            
            return cell
            
        }
        else if indexPath.row == products.count + 3
        {
            //checkout button cell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.checkoutButtonCell, for: indexPath)
            
            return cell
            
        }
        else
        {
            //item cell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.shoppingCartItemCell, for: indexPath) as! ShoppingCartItemCell
            
            cell.product = products[indexPath.row - 1]
            cell.selectionStyle = .none
            return cell
        }
        
        
        
    }
}

