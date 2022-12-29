//
//  HomeViewController.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 28/12/22.
//

import Foundation
import UIKit
import LBTATools
import MapKit
import CoreLocation

private typealias `Self` = HomeViewController

class HomeViewController: UIViewController, MKMapViewDelegate{
    // MARK: - Properties
    var didTapStore: ((Int) -> Void)?
    var didBackToRoot: (() -> Void)?
    lazy var storeListView: StoreTableController = {
        let controller = StoreTableController()
        controller.storeDelegate = self
        return controller
    }()

    lazy var titleLabel: UILabel = {
       let view = UILabel(
        text: "List Store",
        font: .systemFont(ofSize: 20),
        textColor: .darkGray,
        textAlignment: .left,
        numberOfLines: 0)
        
        return view
    }()
    
    lazy var userLabel: UILabel = {
        let view = UILabel(
            font: .systemFont(ofSize: 12),
            textColor: .darkGray,
            textAlignment: .left,
            numberOfLines: 0)

        return view
    }()
    
    lazy var searchTextfield: UITextField = {
        let view = UITextField()
        view.withImage(direction: .LEFT,
                       image: UIImage(named: "IcSearch"),
                       colorBorder: .lightGray)
        view.placeholder = "Cari Toko/Distributor"
        view.addTarget(self, action: #selector(searcTexfieldTapped), for: .editingChanged)
        return view
    }()
    
    lazy var mapView: MKMapView = {
        let view = MKMapView()
        return view
    }()
    
    lazy var logoutButton: UIButton = {
        let view = UIButton()
        view.setTitle("Logout", for: .normal)
        view.setTitleColor(.red, for: .normal)
        view.layer.cornerRadius = 16
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 1.0
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.addTarget(
            self,
            action: #selector(logoutButtonTapped), for: .touchUpInside)

        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let view = UILabel(
            font: .systemFont(ofSize: 14,weight: .semibold),
            textColor: .darkGray,
            textAlignment: .left,
            numberOfLines: 0)

        return view
    }()
    
    private let locationManager = CLLocationManager()
    private var storeAnnotations = [MKAnnotation]()
    
    private var filteredStore: [StoreViewModel]!
    private var timer: Timer?
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        fetchData()

        self.mapView.delegate = self
        self.mapView.register(
          AnnotationView.self,
          forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // reloadAnnotations()
        navigationController?.navigationBar.isHidden = true
    }
    
    private func fetchData() {
        checkLocationService()
        initializeUI()
        let data = LoginModel.Storage.getModel()?.stores
        self.storeListView.items = data!.map({ StoreViewModel($0) })
        self.filteredStore = data!.map({ StoreViewModel($0) })
        reloadAnnotations()

        userLabel.text = LoginModel.Storage.getModel()?.stores?[0].account_name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let now = Date()
        dateLabel.text = "List Kunjungan \(dateFormatter.string(from: now))"
      //  self.storeAnnotations[0] = AnnotationModel(marker: data![0])
       
    }
    
    private func checkLocationService(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            checkLocationAuthorization()
        } else {
            // the user didn't turn it on
        }
    }
    
    private func checkLocationAuthorization(){
        if #available(iOS 14.0, *) {
            switch locationManager.authorizationStatus {
            case .authorizedWhenInUse:
                mapView.showsUserLocation = true
                followUserLocation()
                locationManager.startUpdatingLocation()
                break
            case .denied:
                // Show alert
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                // Show alert
                break
            case .authorizedAlways:
                break
            @unknown default:
                break
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    private func followUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 4000, longitudinalMeters: 4000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    private func reloadAnnotations(){
        self.mapView.annotations.forEach { annotation in
            self.mapView.removeAnnotation(annotation)
        }
        
        self.storeAnnotations.forEach { annotation in
            self.mapView.addAnnotation(annotation)
        }
    }
}

extension Self: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
}

extension Self {
    // MARK: - Actions
    @objc func logoutButtonTapped() {
        
        let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { res in
            self.didBackToRoot!()
            LoginModel.Storage.delete()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { res in
          //  toast("cancel")
        }))
        self.present(alert, animated: true)
        //RSAManager.shared.getEncryptedPassword(from: password)

    }
    
    @objc func searcTexfieldTapped(_ sender: UITextField) {
        timer?.invalidate()
        guard let query = sender.text, !query.isEmpty else {
            self.storeListView.items = filteredStore
            return
        }

        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [weak self] _ in
            let dataFilter = self?.filteredStore.filter({ $0.storeName.contains(query) })
            self?.storeListView.items = dataFilter!
        }
    }
}

extension Self: StoreTableControllerDelegate {
    func storeTableController(
        _ storeTableController: StoreTableController,
        didSelectItemAt index: Int,
        storeModel: StoreViewModel) {
        print("From controller history: \(index)")
            self.didTapStore!(index)
    }
}
