//
//  CategoriesListViewController.swift
//  RestaurantMenu
//
//  Created by huda elhady on 18/05/2021.
//

import UIKit

class CategoriesListViewController: UIViewController {
    
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    var viewModel: CategoriesListViewModel!
    var categoriesList = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CategoriesListViewModel()
        viewModel.getCategories()
        setupTableView()
        setupObservables()
    }
    
    func setupTableView() {
        categoryTableView.estimatedRowHeight = 80
        categoryTableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupObservables() {
        viewModel.isLoading.bindAndFire { (isLoading) in
            if isLoading { self.activityLoader.startSpinner()} else { self.activityLoader.stopSpinner()}
        }
        viewModel.categoryList.bindAndFire { [weak self](categories) in
            self?.categoriesList = categories
            self?.categoryTableView.reloadData()
        }
        
        viewModel.errorMessage.bind { errorMessage in
            self.alert(message: errorMessage, actions: [("OK", .cancel)])
        }
    }

}

extension CategoriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return categoriesList.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableCell.identifier, for: indexPath) as? CategoryTableCell {
                cell.set(categoryName: categoriesList[indexPath.row].name ?? "")
                return cell
            }
            return UITableViewCell()
        }
}

extension CategoriesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CategoryDetailsViewController.create(menuItems: categoriesList[indexPath.row].menuitems!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

