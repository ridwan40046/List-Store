//
//  HomeViewLayout.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 28/12/22.
//

import UIKit

extension HomeViewController {
    func initializeUI() {
        view.stack(
            UIView().hstack(
                UIView().stack(titleLabel,userLabel),
                logoutButton.withWidth(100)),
//                spacing: 10),
            searchTextfield.withHeight(40),
            mapView.withHeight(200),
            dateLabel.withHeight(30),
            storeListView.view,
            spacing: 10).withMargins(.allSides(16))
    }
}
