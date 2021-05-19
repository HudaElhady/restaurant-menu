//
//  CategoriesListViewModel.swift
//  RestaurantMenu
//
//  Created by huda elhady on 18/05/2021.
//

import Foundation

class CategoriesListViewModel: BaseViewModel {

    private var menuRepo: MenuRepo
    var categoryList:Dynamic<[Category]> = Dynamic([Category]())
    var errorMessage: Dynamic<String> = Dynamic("")
    
    init(menuRepo: MenuRepo = MenuRepoImpl()) {
        self.menuRepo = menuRepo
        super.init(isLoading: false)
    }

    func getCategories() {
        startLoading()
        menuRepo.getRestaurantMenu{ [weak self] (result) in
            self?.stopLoading()
            switch result {
            case .success(let response):
                if let categorys = response.categorys {
                    self?.categoryList.value = categorys
                } else {
                    self?.errorMessage.value = "Something went wrong"
                }
                
            case .failure(let error):
                self?.errorMessage.value = error.errorMessage
            }
        }
    }
    
}
