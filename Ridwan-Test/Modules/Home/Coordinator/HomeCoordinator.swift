//
//  HomeCoordinator.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 28/12/22.
//

import Foundation
import UIKit

class HomeCoordinator {

    private let presenter: UINavigationController

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let view = HomeViewController()
        presenter.pushViewController(view, animated: true)
        
        view.didTapStore = { Int in
            self.showDetailStore(index: Int)
        }
        
        view.didBackToRoot = { [weak self]() in
            guard let self = self else { return}
            AuthCoordinator(presenter: self.presenter).start()
        }
    }
    
    private func showDetailStore(index: Int) {
        let controller = StoreDetailViewController()
        controller.index = index
        presenter.pushViewController(controller, animated: true)
    }
}
