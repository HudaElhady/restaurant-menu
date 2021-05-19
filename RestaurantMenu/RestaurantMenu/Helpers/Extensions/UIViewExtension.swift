//
//  UIViewExtension.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import UIKit

extension UIView {

    @IBInspectable var borderColor: UIColor? {
        get { return layer.borderColor.map(UIColor.init) }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius}
        set { layer.cornerRadius =  newValue
            layer.masksToBounds = newValue > 0 }
    }
}
