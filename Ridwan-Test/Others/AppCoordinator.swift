//
//  AppCoordinator.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 27/12/22.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

class ApplicationCoordinator: Coordinator {
    
    private let window: UIWindow
    private let rootViewController: UINavigationController
    private var authCoordinator: AuthCoordinator?
    private var homeCoordinator: HomeCoordinator?
   
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        authCoordinator = AuthCoordinator(presenter: rootViewController)
      //  homeCoordinator = HomeCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        authCoordinator?.start()
        window.makeKeyAndVisible()
    }
}
