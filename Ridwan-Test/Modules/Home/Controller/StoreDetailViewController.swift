//
//  StoreDetailViewController.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 29/12/22.
//

import Foundation
import UIKit

private typealias `Self` = StoreDetailViewController
class StoreDetailViewController: UIViewController {
    // MARK: - Properties
    lazy var image: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dummy")
        view.contentMode = .scaleToFill
        return view
    }()

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowRadius = 5
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var noVisitButton: UIButton = {
        let view = UIButton()
        view.setTitle("No Visit", for: .normal)
        view.backgroundColor = .red
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(submitBttonTapped), for: .touchUpInside)

        return view
    }()
    
    lazy var visitButton: UIButton = {
        let view = UIButton()
        view.setTitle("Visit", for: .normal)
        view.backgroundColor = .blue
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(submitBttonTapped), for: .touchUpInside)

        return view
    }()
    
    lazy var storeNameLabel: UILabel = {
       let view = UILabel(
        font: .systemFont(ofSize: 16,weight: .semibold),
        textColor: .black,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    
    lazy var storeAddressLabel: UILabel = {
       let view = UILabel(
        font: .systemFont(ofSize: 14),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    
    lazy var outletLabel: UILabel = {
       let view = UILabel(
        text: "Tipe Outlet",
        font: .systemFont(ofSize: 14,weight: .medium),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    
    lazy var dataOutletLabel: UILabel = {
       let view = UILabel(
        font: .systemFont(ofSize: 14),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    
    lazy var displayLabel: UILabel = {
       let view = UILabel(
        text: "Tipe Display",
        font: .systemFont(ofSize: 14,weight: .medium),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    lazy var dataDisplayLabel: UILabel = {
       let view = UILabel(
        font: .systemFont(ofSize: 14),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    lazy var subDisplayLabel: UILabel = {
       let view = UILabel(
        text: "Sub Tipe Display",
        font: .systemFont(ofSize: 14,weight: .medium),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    lazy var dataSubDisplayLabel: UILabel = {
       let view = UILabel(
        font: .systemFont(ofSize: 14),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    lazy var ertmLabel: UILabel = {
       let view = UILabel(
        text: "ERTM",
        font: .systemFont(ofSize: 14,weight: .medium),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    lazy var ertmDataLabel: UILabel = {
       let view = UILabel(
        text: ": Ya",
        font: .systemFont(ofSize: 14),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    lazy var paretoLabel: UILabel = {
       let view = UILabel(
        text: "Pareto",
        font: .systemFont(ofSize: 14,weight: .medium),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    lazy var dataParetoLabel: UILabel = {
       let view = UILabel(
        text: ": Ya",
        font: .systemFont(ofSize: 14),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    lazy var merchandisingLabel: UILabel = {
       let view = UILabel(
        text: "E-merchandising",
        font: .systemFont(ofSize: 14,weight: .medium),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    lazy var dataMerchandisingLabel: UILabel = {
       let view = UILabel(
        text: ": Ya",
        font: .systemFont(ofSize: 14),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    lazy var visitLabel: UILabel = {
       let view = UILabel(
        text: "Last Visit",
        font: .systemFont(ofSize: 14,weight: .medium),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    lazy var dataVisitLabel: UILabel = {
       let view = UILabel(
        font: .systemFont(ofSize: 14),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    var index: Int?
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchData()
        initializeUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    func fetchData() {
        let data = LoginModel.Storage.getModel()?.stores![index!]
        storeNameLabel.text = data?.store_name
        storeAddressLabel.text = data?.address
        dataOutletLabel.text = ": \(data?.dc_name ?? "")"
        dataDisplayLabel.text = ": \(data?.channel_name ?? "")"
        dataSubDisplayLabel.text = ": \(data?.subchannel_name ?? "")"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let now = Date()
        dataVisitLabel.text = "\(dateFormatter.string(from: now))"
    }
}

// MARK: - Actions
extension Self {
    @objc func submitBttonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
