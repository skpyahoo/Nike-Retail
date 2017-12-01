//
//  AdminProductImagesHeaderView.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 01/12/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

class AdminProductImagesHeaderView: UIView {

    @IBOutlet weak var pageControl: UIPageControl!

}

extension AdminProductImagesHeaderView : AdminProductImagesPageVCDelegate
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
