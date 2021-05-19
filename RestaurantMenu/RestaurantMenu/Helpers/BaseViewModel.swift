//
//  BaseViewModel.swift
//  RestaurantMenu
//
//  Created by huda elhady on 18/05/2021.
//

import Foundation

class BaseViewModel {

    var isLoading: Dynamic<Bool> = Dynamic(false)

    init(isLoading: Bool) {
        self.isLoading.value = isLoading
    }

    func startLoading() {
        isLoading.value = true
    }

    func stopLoading() {
        isLoading.value = false
    }

}
