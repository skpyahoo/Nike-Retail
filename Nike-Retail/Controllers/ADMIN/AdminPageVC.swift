//
//  AdminPageVC.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 01/12/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

protocol AdminProductImagesPageVCDelegate: class
{
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

class AdminPageVC: UIPageViewController {
    
    var images: [UIImage]?
    
    weak var adminPageViewControllerDelegate: AdminProductImagesPageVCDelegate?
    
    struct StoryBoard {
        static let adminProductImageVC = "adminProductImageVC"
    }
    
    lazy var controllers: [UIViewController] = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [UIViewController]()
        
        if let images = self.images
        {
            for image in images
            {
                let productImageVC = storyboard.instantiateViewController(withIdentifier: StoryBoard.adminProductImageVC)
                controllers.append(productImageVC)
            }
        }
        
        self.adminPageViewControllerDelegate?.setupPageController(numberOfPages: controllers.count)
        
        return controllers
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        
        self.turnToPage(index: 0)
    }
        // Do any additional setup after loading the view.
    

func turnToPage(index: Int)
{
    let controller = controllers[index]
    var direction = UIPageViewControllerNavigationDirection.forward
    
    if let currentVC = viewControllers?.first
    {
        guard let currentIndex = controllers.index(of: currentVC) else {return}
        if currentIndex > index
        {
            direction = .reverse
        }
    }
    
    self.configuewDisplaying(viewController: controller)
    
    setViewControllers([controller], direction: direction, animated: true, completion: nil)
    
}

func configuewDisplaying(viewController: UIViewController)
{
    for (index, vc) in controllers.enumerated()
    {
        if viewController === vc {
            if let productImageVC = viewController as? AdminProductImageVC
            {
                productImageVC.image = self.images?[index]
                
                self.adminPageViewControllerDelegate?.turnPageController(to: index)
            }
        }
    }
}


}

extension AdminPageVC: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController)
        {
            if index < controllers.count - 1
            {
                return controllers[index + 1]
            }
        }
        
        
        return controllers.first
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController)
        {
            if index > 0
            {
                return controllers[index - 1]
            }
        }
        
        return controllers.last
    }
}

extension AdminPageVC: UIPageViewControllerDelegate
{
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        self.configuewDisplaying(viewController: pendingViewControllers.first as! AdminProductImageVC)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if !completed
        {
            self.configuewDisplaying(viewController: previousViewControllers.first as! AdminProductImageVC)
        }
    }
    
    
    
}



