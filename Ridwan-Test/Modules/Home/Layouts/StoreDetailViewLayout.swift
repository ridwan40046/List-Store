//
//  StoreDetailViewLayout.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 29/12/22.
//

import UIKit

extension StoreDetailViewController {
    func initializeUI() {
        
        containerView.stack(
            storeNameLabel,
            storeAddressLabel,
            UIView().hstack(outletLabel,dataOutletLabel,spacing: 10),
            UIView().hstack(displayLabel,dataDisplayLabel,spacing: 10),
            UIView().hstack(subDisplayLabel,dataSubDisplayLabel,spacing: 10),
            UIView().hstack(ertmLabel,ertmDataLabel,spacing: 10),
            UIView().hstack(paretoLabel,dataParetoLabel,spacing: 10),
            UIView().hstack(merchandisingLabel,dataMerchandisingLabel,spacing: 10),
            UIView(),
            UIView(),
            UIView().stack(visitLabel,dataVisitLabel,spacing: 3),
            UIView(),
            spacing: 8).withMargins(.allSides(16))
        
        view.stack(
            UIView().stack(
                image,
                UIView().stack(containerView).withMargins(.allSides(8)),
                spacing: -27,
                distribution: .fillEqually),
            UIView().hstack(
                noVisitButton.withHeight(50),
                visitButton.withHeight(50),
                spacing: 15,
                distribution: .fillEqually
            ).withMargins(.init(top: 0, left: 8, bottom: 8, right: 8)),
            spacing: 5
        ).withMargins(.allSides(12))
    }
}
