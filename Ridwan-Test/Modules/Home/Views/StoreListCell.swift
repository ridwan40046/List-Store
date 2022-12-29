//
//  StoreListCell.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 28/12/22.
//

import Foundation
import UIKit
import LBTATools

class StoreListCell: TableViewCell<StoreViewModel> {
    // MARK: - Properrties
    lazy var markerButton: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "IcMarker")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowRadius = 5
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var storeNameLabel: UILabel = {
        let view = UILabel(
            text: "",
            font: UIFont.systemFont(ofSize: 14, weight: .semibold),
            textColor: .darkGray,
            numberOfLines: 1)
        return view
    }()
    lazy var radiusLabel: UILabel = {
        let view = UILabel(
            text: "",
            font: UIFont.systemFont(ofSize: 12),
            textColor: .darkGray,
            textAlignment: .center,
            numberOfLines: 1)
        return view
    }()
    
    lazy var addressLabel: UILabel = {
        let view = UILabel(
            text: "",
            font: UIFont.systemFont(ofSize: 12),
            textColor: .darkGray,
            numberOfLines: 1)
        return view
    }()
    
    lazy var regionLabel: UILabel = {
        let view = UILabel(
            text: "",
            font: UIFont.systemFont(ofSize: 12),
            textColor: .darkGray,
            numberOfLines: 1)
        return view
    }()
    
    override var item: StoreViewModel! {
        didSet {
            storeNameLabel.text = item.storeName
            addressLabel.text = item.address
            regionLabel.text = item.regionName
            radiusLabel.text = item.areaId
        }
    }
    
    // MARK: - Life Cycles
    override func setupViews() {
        super.setupViews()
        
        containerView.hstack(
                UIView().stack(storeNameLabel,addressLabel,regionLabel),
                UIView().stack(markerButton.withWidth(40),radiusLabel,spacing: 3),
                spacing: 10).withMargins(.allSides(8))
        contentView.hstack(
            containerView).withMargins(.init(top: 8, left: 5, bottom: 8, right: 5))
    }
}
