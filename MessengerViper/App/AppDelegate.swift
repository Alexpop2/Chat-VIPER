//
//  AppDelegate.swift
//  MessengerViper
//
//  Created by Рабочий on 22/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var app: Application?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        app = Application()
        window?.rootViewController = app?.fire()
        window?.makeKeyAndVisible()
        return true
    }

}

