//
//  CartTableViewCell.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import UIKit

class CartTableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
        
    static let identifier = "CartTableCell"

    func set(item: MenuItem) {
        nameLabel.text = item.name
        descriptionLabel.text = item.descriptionField
        priceLabel.text = "\(item.price ?? 0)"
    }
    
}
