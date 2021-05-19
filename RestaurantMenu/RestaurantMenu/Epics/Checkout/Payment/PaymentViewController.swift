//
//  CheckOutViewController.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet var paymentImages: [UIImageView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Place Order"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setPrice()
    }
    
    func setPrice() {
        priceLabel.text = Cart.shared.getTotalCost()
    }
    
    static func create() -> PaymentViewController {
        if let vc = UIStoryboard(name: StoryBoardsIDs.payment.id, bundle: nil).instantiateViewController(withIdentifier: ViewControllersIDs.PaymentVC.id) as? PaymentViewController {
            return vc
        }
        return PaymentViewController()
    }
    
    @IBAction func paymentButtonAction(_ sender: UIButton) {
        paymentImages.forEach{
            $0.image =  $0 == paymentImages[sender.tag] ? #imageLiteral(resourceName: "ic_radio_selected") : #imageLiteral(resourceName: "ic_radio") }
    }
    
    @IBAction func placeOrderButtonAction(_ sender: UIButton) {
        Cart.emptyCart()
        self.alert(message: "You Successfully Placed Your Order", actions: [("OK", .cancel, { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        })])
        
    }
    
}



