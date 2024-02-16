//
//  AppDelegate.swift
//  MVVM
//
//  Created by Max Soiferman on 7/2/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let nc = UINavigationController(rootViewController: MainViewController())
        
        window.rootViewController = nc
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }


}

