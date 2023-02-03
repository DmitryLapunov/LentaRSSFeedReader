//
//  AppDelegate.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 31.01.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navBarFormatter = NavBarFormatter()
        navBarFormatter.configureNavBar()
        let builder = NewsFeedBuilder()
        let newsFeedController = builder.build()
        let navigationController = UINavigationController(rootViewController: newsFeedController)
        navigationController.navigationBar.topItem?.backButtonTitle = ""
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

