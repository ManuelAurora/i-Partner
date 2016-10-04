//
//  AppDelegate.swift
//  i-Partner
//
//  Created by Мануэль on 03.10.16.
//  Copyright © 2016 AuroraInterplay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var records = [Record]()  {// Not a good option place records here, I know
        
        didSet
        {
            let navController = window?.rootViewController as! UINavigationController
            
            let controller = navController.viewControllers.first! as! RecordsTableViewController
            
            controller.tableView.reloadData()
        }
        
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }


}

