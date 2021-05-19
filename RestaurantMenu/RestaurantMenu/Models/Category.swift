//
//  Category.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import Foundation

struct Category : Codable {

    let id : String?
    let menuitems : [MenuItem]?
    let name : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case menuitems = "menu-items"
        case name = "name"
    }

}

struct MenuItem : Codable, Equatable {

    let descriptionField : String?
    let id : String?
    let name : String?
    let price : Float?

    enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
        case id = "id"
        case name = "name"
        case price = "price"
    }
    
    public static func == (lhs: MenuItem, rhs: MenuItem) -> Bool
    {
        return lhs.id == rhs.id
    }
    
}
