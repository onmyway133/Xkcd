//
//  AppDelegate.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let flowController = AppFlowController()

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = flowController
    window?.makeKeyAndVisible()
    flowController.start()

    return true
  }
}
