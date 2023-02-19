//
//  ProductListViewController.swift
//  LeBonCoin
//
//  Created by Zakaria El Moutassim on 14/02/2023.
//

import UIKit

class ProductListViewController: ViewController {
    
    var productsTableView: UITableView!
    var viewModel: ProductListViewModel!
    
    public var items: [Product] = [] {
        didSet {
            productsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        setupTableView()
        viewModel.fetchAllProducts()
    }
    
    
    private func setupTableView() {
        productsTableView = UITableView()
        productsTableView.delegate = self
        productsTableView.dataSource = self
        view.addSubview(productsTableView)
        productsTableView.register(ProductViewCell.self,
                                   forCellReuseIdentifier: ProductViewCell.identifier)
        productsTableView.constrain(productsTableView.constraintsForEdgesWithSafeArea(to: view))
    }
}
