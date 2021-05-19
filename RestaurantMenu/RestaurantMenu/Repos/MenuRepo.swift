//
//  MenuRepo.swift
//  RestaurantMenu
//
//  Created by huda elhady on 18/05/2021.
//

import Foundation

protocol MenuRepo {
    func getRestaurantMenu(completionHandler: @escaping (Result<RestaurantMenuModel,NetworkError>)->Void)
}

class MenuRepoImpl: MenuRepo {

    func getRestaurantMenu(completionHandler: @escaping (Result<RestaurantMenuModel,NetworkError>)->Void) {
        
        guard let jsonData = readLocalFile(forName: "restaurant-menu") ,
              let resturantData = try? JSONDecoder().decode(RestaurantMenuModel.self, from: jsonData) else {
            return completionHandler(.failure(NetworkError.requestFailed))
        }
        completionHandler(.success(resturantData))

    }
    
}

extension MenuRepoImpl {
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
