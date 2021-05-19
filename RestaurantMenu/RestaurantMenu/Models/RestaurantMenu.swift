//
//  RestaurantMenu.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import Foundation

struct RestaurantMenuModel : Codable {

    let categorys : [Category]?
    let restaurantinfo : RestaurantInfo?


    enum CodingKeys: String, CodingKey {
        case categorys = "categorys"
        case restaurantinfo
    }

}
