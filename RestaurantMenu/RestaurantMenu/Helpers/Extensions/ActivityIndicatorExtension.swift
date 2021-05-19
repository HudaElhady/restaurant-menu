//
//  ActivityIndicatorExtension.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import UIKit

extension UIActivityIndicatorView {
    func startSpinner() {
        startAnimating()
        isHidden = false
        isUserInteractionEnabled = false
    }

    func stopSpinner() {
        stopAnimating()
        isHidden = true
        isUserInteractionEnabled = true
    }
}
