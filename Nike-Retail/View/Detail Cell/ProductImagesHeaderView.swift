//
//  ProductImagesHeaderView.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 06/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class ProductImagesHeaderView: UIView {

    @IBOutlet weak var pageControl: UIPageControl!

}

extension ProductImagesHeaderView : ProductImagesPageVCDelegate
{
    func setupPageController(numberOfPages: Int)
    {
        pageControl.numberOfPages = numberOfPages
    }
    
    
    func turnPageController(to index: Int)
    {
        pageControl.currentPage = index
    }
}
