//
//  AdminProductUploaderTableVC.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 29/11/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class AdminProductUploaderTableVC: UITableViewController {
    
    struct Storyboard {
        static let ProductUploaderCell = "ProductUploaderCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 70.0
        tableView.rowHeight = UITableViewAutomaticDimension

    }

    @IBAction func openAlbum(_ sender: Any) {
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
        
        
        cell.selectionStyle = .none
        
        return cell
    }

    

}
