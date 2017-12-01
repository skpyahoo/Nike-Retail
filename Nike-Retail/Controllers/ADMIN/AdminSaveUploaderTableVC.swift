//
//  AdminSaveUploaderTableVC.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 01/12/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class AdminSaveUploaderTableVC: UITableViewController {

    @IBOutlet var productImagesHeaderView: AdminProductImagesHeaderView!
    
    var images: [UIImage]?
    var productDict: [String:Any]?
    
    struct Storyboard {
        static let adminShowImagesPageVC = "adminShowProductImagesPageVC"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Storyboard.adminShowImagesPageVC
        {
            if let imagesPageVC = segue.destination  as? AdminPageVC
            {
                imagesPageVC.images = images
                
                imagesPageVC.adminPageViewControllerDelegate = productImagesHeaderView
            }
        }
    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
}
