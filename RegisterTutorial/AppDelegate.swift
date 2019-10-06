//
//  AppDelegate.swift
//  RegisterTutorial
//
//  Created by Rennan Rebouças on 06/09/19.
//  Copyright © 2019 Rennan Rebouças. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let rootViewController: UINavigationController = {
        let firsViewController = ViewController()
        return UINavigationController(rootViewController: firsViewController)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
        return true
    }

}


