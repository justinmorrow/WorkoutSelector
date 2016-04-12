//
//  AppDelegate.swift
//  WorkoutSelector
//
//  Created by Justin Morrow on 4/10/16.
//  Copyright © 2016 JPMorrow. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Define navigationController
        let navigationController = UINavigationController(rootViewController: ViewController())
        
        window.rootViewController = navigationController
        
        self.window = window
        window.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }
}

