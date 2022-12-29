//
//  LoginModel.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 28/12/22.
//

import Foundation

struct LoginModel: Codable {
    let status: String
    let message: String
    let stores: [StoreModel]?
    
    enum Storage {
        static let key = "Saved_LoginModel_Storage_Key"
        
        static func save(_ model: LoginModel) {
            if let encoded = try? JSONEncoder().encode(model) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
        
        static func getModel() -> LoginModel? {
            if let model = UserDefaults.standard.object(forKey: key) as? Data {
                return try? JSONDecoder().decode(LoginModel.self, from: model)
            }
            
            return nil
        }
        
        static func delete() {
            UserDefaults.standard.set(nil, forKey: key)
        }
    }
}
