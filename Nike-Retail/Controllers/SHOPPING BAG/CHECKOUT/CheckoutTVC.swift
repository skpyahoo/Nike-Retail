//
//  CheckoutTVC.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 07/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class CheckoutTVC: UITableViewController {
    
    struct Storyboard {
        
        static let creditCardInformationCell = "CreditCardInformationCell"
        static let cartDetailCell = "cartDetailCell"            // cell 2
        static let cartTotalCell = "cartTotalCell"
        static let submitButtonCell = "submitButtonCell"
        static let billingcell = "billingCell"
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 70.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.billingcell, for: indexPath)
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.creditCardInformationCell, for: indexPath) as! CreditCardInformationCell
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cartDetailCell, for: indexPath)
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cartTotalCell, for: indexPath)
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.submitButtonCell, for: indexPath)
            return cell
            
        default: return UITableViewCell()
        }
        
   }
    

    

}
