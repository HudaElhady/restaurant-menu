//
//  Cart.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import Foundation

class Cart
{
    static var shared = Cart()
    private var products = [MenuItem]()

    var notes: String?

    private init()
    {
        products = UserDefaults.standard.getObject(key: "CartItems") ?? [MenuItem]()
    }

    class func emptyCart()
    {
        UserDefaults.standard.removeObject(forKey: "CartItems")
        
        Cart.shared = Cart()
        Cart.shared.products = []
    }

    func addItem(_ item: MenuItem)
    {
        updateProduct(product: item)
        saveToDisk()
    }
    

    func saveToDisk()
    {
        UserDefaults.standard.saveObject(rawData: products, forKey: "CartItems")
        
    }

    func getTotalItems() -> Int
    {
        return products.count
    }

    func getAll() -> [MenuItem]
    {
        return products
    }

    func getTotalCost() -> String
    {
        return String(getTotalWitoutAmount())
    }

    func getTotalWitoutAmount()->Float{
        return products.reduce(0, { $0 + ($1.price ?? 0) })
               
    }

    private func updateProduct(product: MenuItem)
    {
        if let index = products.index(of: product)
        {
            products[index] = product
        }
        else
        {
            products.append(product)
        }
    }

}
