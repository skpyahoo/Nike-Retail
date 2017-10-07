//
//  ProductDetailTVC.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 06/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class ProductDetailTVC: UITableViewController {
    
    @IBOutlet var productImagesHeaderView: ProductImagesHeaderView!
    var product: Product!
    
    struct Storyboard {
        
        static let productDetailCell = "ProductDetailCell"
        static let buyButtonCell = "BuyButtonCell"
        static let showProductDetailCell = "ShowProductDetailCell"
        static let suggestionTableCell = "SuggestionTableCell"
        static let showImagesPageVC = "ShowProductImagesPageVC"
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
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.suggestionTableCell, for: indexPath) as! SuggestionTableCell
            //cell.selectionStyle = .none
            
            return cell
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 3
        {
            return tableView.bounds.width + 68
        }
        else
        {
            return UITableViewAutomaticDimension
        }
    }
    
    
    //Mark: - UITabeleViewDelegate
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == 3
        {
            if let cell = cell as? SuggestionTableCell
            {
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
                cell.collectionView.reloadData()
                cell.collectionView.isScrollEnabled = false
            }
        }
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Storyboard.showImagesPageVC
        {
            if let imagesPageVC = segue.destination  as? ProductImagesPageVC
            {
                imagesPageVC.images = product.images
                
                imagesPageVC.pageViewControllerDelegate = productImagesHeaderView
            }
        }
    }
   

}


//MARK: - UICollectionViewDataSource
extension ProductDetailTVC : UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionCollectionViewCell", for: indexPath) as! SuggestionCollectionViewCell
        
        let products = Product.fetchProducts()
        cell.image = products[indexPath.item].images?.first
        
        return cell
    }
    
}


//MARK: - UICollectionViewDelegate

extension ProductDetailTVC : UICollectionViewDelegate
{
    
}


//MARK: - UICOLLECTIONVIEWDELEGATEFLOWLAYOUT

extension ProductDetailTVC : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout
        {
            layout.minimumLineSpacing = 5.0
            layout.minimumInteritemSpacing = 2.5
            
            let itemWidth = (collectionView.bounds.width - 5.0) / 2.0
            
            return CGSize(width: itemWidth, height: itemWidth)
        }
        
        return CGSize.zero
    }
}






