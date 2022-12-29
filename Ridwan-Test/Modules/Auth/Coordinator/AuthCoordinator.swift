//
//  AuthCoordinator.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 27/12/22.
//

import Foundation
import UIKit

class AuthCoordinator {

    private let presenter: UINavigationController

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    public func start() {
        let view = LoginViewController()
        presenter.pushViewController(view, animated: true)
        
        view.didLoginSuccess = { [weak self]() in
            guard let self = self else { return }
            self.gotoHome()
        }
    }
    
    private func gotoHome() {
        HomeCoordinator(presenter: presenter).start()
    }
}
