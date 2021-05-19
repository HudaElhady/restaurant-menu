//
//  MenuItemTableCell.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import UIKit

class MenuItemTableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var addToCartHandler: (()-> Void)?
    
    static let identifier = "MenuItemTableCell"

    func set(item: MenuItem, action: @escaping ()-> Void) {
        nameLabel.text = item.name
        descriptionLabel.text = item.descriptionField
        priceLabel.text = "\(item.price ?? 0)"
        self.addToCartHandler = action
    }
    
    @IBAction private func addToCartButtonAction(_ sender: Any) {
        addToCartHandler?()
    }
}
