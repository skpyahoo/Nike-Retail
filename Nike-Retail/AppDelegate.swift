//
//  AppDelegate.swift
//  Nike-Retail
//
//  Created by Sagar Pahlajani on 05/10/17.
//  Copyright © 2017 Sagar Pahlajani. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        configureAppearence()
        
        return true
    }

    func configureAppearence()
    {
        UITabBar.appearance().tintColor = UIColor.black
        UITabBar.appearance().isTranslucent = false
        
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().isTranslucent = false
        
    }

}

