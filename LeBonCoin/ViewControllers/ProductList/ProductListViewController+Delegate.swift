//
//  ProductListViewController+Delagate.swift
//  LeBonCoin
//
//  Created by Zakaria El Moutassim on 14/02/2023.
//

import UIKit

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductViewCell.identifier, for: indexPath) as! ProductViewCell
        let product = items[indexPath.row]
        cell.configureCell(product: product, categoryPdt: viewModel.getCategorieFromId(categoryId: product.categoryID))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return KcellHeigh
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        let product = items[indexPath.row]
        let category = viewModel.getCategorieFromId(categoryId: product.categoryID)
        detailsVC.viewModel = DetailsViewModel(detailsProduct: (product: product, category: category))
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension ProductListViewController: ProductListViewModelDelegate {
    
    func willMakeRequest() {
        setSpinner(visible: true)
    }
    
    func didMakeSuccessfullRequest() {
        setSpinner(visible: false)
        items = viewModel.productList
    }
    
    func didFinishRequestWithError(errorDescription: String) {
        notifyUserError(message: errorDescription)
    }
}
