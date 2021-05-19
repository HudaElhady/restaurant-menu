//
//  RestaurantInfo.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import Foundation

struct RestaurantInfo : Codable {

    let address : String?
    let deliverablearea : [DeliverableArea]?
    let id : String?
    let logo : String?
    let name : String?
    let paymentmethods : [PaymentMethod]?
    let totalcategory : String?

    enum CodingKeys: String, CodingKey {
        case address = "address"
        case deliverablearea = "deliverable-area"
        case id = "id"
        case logo = "logo"
        case name = "name"
        case paymentmethods = "payment-methods"
        case totalcategory = "total-category"
    }
    
}

struct PaymentMethod : Codable {

    let id : String?
    let type : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
    }

}

struct DeliverableArea : Codable {

    let id : String?
    let name : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
}
