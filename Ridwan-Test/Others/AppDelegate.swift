//
//  AppDelegate.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 26/12/22.
//

import UIKit
import IQKeyboardManagerSwift

private typealias `Self` = AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var applicationCoordinator: ApplicationCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        setMainWindow()
        return true
    }

}

extension Self {
    private func setMainWindow() {
       let window = UIWindow(frame: UIScreen.main.bounds)
       let appCoordinator = ApplicationCoordinator(window: window)
       self.window = window
       self.applicationCoordinator = appCoordinator
       appCoordinator.start()
    }
}
