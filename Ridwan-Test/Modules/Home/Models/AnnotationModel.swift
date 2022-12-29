//
//  AnnotationModel.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 29/12/22.
//

import Foundation
import MapKit

class AnnotationModel: NSObject, MKAnnotation {
    let discipline: String?
    let coordinate: CLLocationCoordinate2D
    
    init(marker: StoreModel) {
        self.discipline = "store"
        
        let latitude = CLLocationDegrees(Double(marker.latitude) ?? -6.3301969)
        let longitude = CLLocationDegrees(Double(marker.longitude) ?? 106.962041)
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        super.init()
    }
}

class AnnotationView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let annotation = newValue as? AnnotationModel else {
                return
            }
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            let imageView = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 48, height: 48)))
            
            imageView.backgroundColor = .lightGray
            rightCalloutAccessoryView = imageView
            
            if annotation.discipline == "store" {
                image = UIImage(named: "IcMarker")
            } else {
                image = UIImage(named: "IcMarker")
            }

        }
    }
}
