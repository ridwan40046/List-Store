//
//  StoreModel.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 28/12/22.
//

import Foundation

struct StoreModel: Codable {
    let store_id: String
    let store_code: String
    let store_name: String
    let address: String
    let dc_id: String
    let dc_name: String
    let account_id: String

    let account_name: String
    let subchannel_id: String
    let subchannel_name: String
    let channel_id: String
    let channel_name: String
    let area_id: String
    let area_name: String
    let region_id: String
    let region_name: String
    let latitude: String
    let longitude: String
    
    enum Storage {
        static let key = "Saved_StoreModel_Storage_Key"

        static func save(_ model: [StoreModel]) {
            if let encoded = try? JSONEncoder().encode(model) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }

        static func getModel() -> [StoreModel]? {
            if let model = UserDefaults.standard.object(forKey: key) as? Data {
                return try? JSONDecoder().decode([StoreModel].self, from: model)
            }

            return nil
        }

        static func delete() {
            UserDefaults.standard.set(nil, forKey: key)
        }
    }
}

