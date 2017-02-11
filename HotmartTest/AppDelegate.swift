//
//  AppDelegate.swift
//  HotmartTest
//
//  Created by Tiago Braga on 05/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // style
        Style.general()
        
        return true
    }

}

