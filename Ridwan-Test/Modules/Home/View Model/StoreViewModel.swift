//
//  StoreViewModel.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 29/12/22.
//

import Foundation

class StoreViewModel: ViewModel<StoreModel> {
    var storeName: String = ""
    var address: String = ""
    var regionName: String = ""
    var areaId: String = ""
    
    override var item: StoreModel! {
        didSet {
            storeName = item.store_name
            address = item.address
            regionName = item.region_name
            areaId = "\(item.area_id)m"
        }
    }
}
