//
//  UserDefaultsExtension.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import Foundation

extension UserDefaults
{
    func saveObject<T:Codable>(rawData:T,forKey key:String)
    {
        guard let encoded = try? JSONEncoder().encode(rawData) else { return }
        
        UserDefaults.standard.set(encoded, forKey: key)
    }
    
    func getObject<T:Decodable>(key:String)->T?
    {
        guard let data = UserDefaults.standard.object(forKey: key) as? Data, let object = try? JSONDecoder().decode(T.self, from: data) else { return nil }
        return object
    }
}
