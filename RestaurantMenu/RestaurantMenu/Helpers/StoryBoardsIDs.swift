//
//  StoryBoardsIDs.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import Foundation

enum StoryBoardsIDs: String {
    case main = "Main"
    case cart = "Cart"
    case payment = "Payment"
    
    var id: String {
        return self.rawValue
    }
}

enum ViewControllersIDs: String {
    case CategoryDetailsVC = "CategoryDetailsViewController"
    case CartVC = "CartDetailsViewController"
    case PaymentVC = "PaymentViewController"
    var id: String {
        return self.rawValue
    }
}
