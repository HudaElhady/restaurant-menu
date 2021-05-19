//
//  CartDetailsViewController.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import UIKit

class CartDetailsViewController: UIViewController {
    @IBOutlet weak var cartTableView: UITableView!
    
    private var menuItems = [MenuItem]() {
        didSet {
            cartTableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cart"
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "Checkout", style: .done, target: self, action: #selector(openPayment)), animated: true)
        tableViewSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        menuItems = Cart.shared.getAll()
    }
    
    func tableViewSetup() {
        cartTableView.estimatedRowHeight = 80
        cartTableView.rowHeight = UITableView.automaticDimension
    }
    
    static func create() -> CartDetailsViewController {
        if let vc = UIStoryboard(name: StoryBoardsIDs.cart.id, bundle: nil).instantiateViewController(withIdentifier: ViewControllersIDs.CartVC.id) as? CartDetailsViewController {
            return vc
        }
        return CartDetailsViewController()
    }
    
    @objc func openPayment() {
        let cartVC = PaymentViewController.create()
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
}

extension CartDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menuItems.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CartTableCell.identifier, for: indexPath) as? CartTableCell {
                cell.set(item: menuItems[indexPath.row])
                return cell
            }
            return UITableViewCell()
        }
}
