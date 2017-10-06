//
//  FeedTableViewController.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 06/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    
    var products: [Product]?
    
    struct Storyboard {
        
        static let feedProductCell = "FeedProductCell"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "FEED"
        fetchProducts()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension

    }
    
    func fetchProducts()
    {
        products = Product.fetchProducts()
        tableView.reloadData()
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if let products = products
        {
            return products.count
        }
        else
        {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewController.Storyboard.feedProductCell, for: indexPath) as! FeedProductCell

        // Configure the cell...
        
        if let products = products
        {
            let product = products[indexPath.row]
            cell.product = product
            cell.selectionStyle = .none
        }
        

        return cell
    }
    

    
}
