//
//  CategoryDetailsViewController.swift
//  RestaurantMenu
//
//  Created by huda elhady on 19/05/2021.
//

import UIKit

class CategoryDetailsViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var viewModel: CategoryDetailsViewModel!
    private var menuItems = [MenuItem]() {
        didSet {
            menuTableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CategoryDetailsViewModel()
        tableViewSetup()
        setupObservables()
        self.title = "Menu"
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "View Cart", style: .done, target: self, action: #selector(openCart)), animated: true)
    }
    
    func tableViewSetup() {
        menuTableView.estimatedRowHeight = 80
        menuTableView.rowHeight = UITableView.automaticDimension
    }
    
    static func create(menuItems: [MenuItem]) -> CategoryDetailsViewController {
            if let vc = UIStoryboard(name: StoryBoardsIDs.main.id, bundle: nil).instantiateViewController(withIdentifier: ViewControllersIDs.CategoryDetailsVC.id) as? CategoryDetailsViewController {
                vc.menuItems = menuItems
                return vc
            }
            return CategoryDetailsViewController()
        }
    
    func setupObservables() {
            viewModel.message.bind { errorMessage in
                self.alert(message: errorMessage, actions: [("OK", .cancel)])
            }
        }
    
    @objc func openCart() {
        let cartVC = CartDetailsViewController.create()
        self.navigationController?.pushViewController(cartVC, animated: true)
    }

}

extension CategoryDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menuItems.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: MenuItemTableCell.identifier, for: indexPath) as? MenuItemTableCell {
                cell.set(item: menuItems[indexPath.row]) { [weak self] in
                    guard let self = self else {return}
                    self.viewModel.addToCart(menuItem: self.menuItems[indexPath.row])
                }
                return cell
            }
            return UITableViewCell()
        }
}


