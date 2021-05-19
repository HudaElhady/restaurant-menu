//
//  CategoryDetailsViewModel.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import Foundation

class CategoryDetailsViewModel: BaseViewModel {

    private var menuRepo: MenuRepo
    var categoryList:Dynamic<[Category]> = Dynamic([Category]())
    var message: Dynamic<String> = Dynamic("")
    
    init(menuRepo: MenuRepo = MenuRepoImpl()) {
        self.menuRepo = menuRepo
        super.init(isLoading: false)
    }
    
    func addToCart(menuItem: MenuItem) {
        Cart.shared.addItem(menuItem)
        message.value = "Item added successfully to your cart"
    }
    
}
