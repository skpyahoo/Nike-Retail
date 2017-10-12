//
//  FeedTableViewController.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 06/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit
import Firebase

class FeedTableViewController: UITableViewController {
    
    var products: [Product]?
    private var selectedProduct: Product?
    
    struct Storyboard {
        
        static let feedProductCell = "FeedProductCell"
        static let showProductDetail = "ShowProductDetail"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        do {
//            try Auth.auth().signOut()
//
//        }
//        catch let signOutErr {
//
//            print("Failed to signOut", signOutErr)
//
//        }
        
        if Auth.auth().currentUser == nil
        {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "showWelcomeVC", sender: nil)

            }
            return
        }
        
        navigationItem.title = "FEED"
        fetchProducts()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser == nil
        {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "showWelcomeVC", sender: nil)
                
            }
            return
        }
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedProduct = products?[indexPath.row]
        performSegue(withIdentifier: Storyboard.showProductDetail, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Storyboard.showProductDetail {
            if let productDetailTVC = segue.destination as? ProductDetailTVC {
                productDetailTVC.product = selectedProduct
            }
        }
    }
    

    
}
