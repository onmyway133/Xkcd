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
  private let flowController = AppFlowController()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = flowController
    window?.makeKeyAndVisible()
    flowController.start()

    return true
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    flowController.favoriteManager.load()
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    flowController.favoriteManager.save()
  }
}
