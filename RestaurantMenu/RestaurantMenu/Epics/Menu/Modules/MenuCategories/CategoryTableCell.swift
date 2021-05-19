//
//  CategoryTableCell.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import UIKit

class CategoryTableCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    
    static let identifier = "CategoryTableCell"

    func set(categoryName: String) {
        categoryLabel.text = categoryName
    }
}
