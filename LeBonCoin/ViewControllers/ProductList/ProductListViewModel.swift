//
//  ProductListViewModel.swift
//  LeBonCoin
//
//  Created by Zakaria El Moutassim on 14/02/2023.
//

import UIKit
import Combine

protocol ProductListViewModelDelegate: AnyObject {
    func willMakeRequest()
    func didMakeSuccessfullRequest()
    func didFinishRequestWithError(errorDescription: String)
}

class ProductListViewModel: ViewModel {

    weak var delegate: ProductListViewModelDelegate?
    var productList = [Product]()
    var categoryList = [Categorie]()
    private var cancellable: AnyCancellable?
    
    init(delegate : ProductListViewModelDelegate) {
        self.delegate = delegate
    }
    
    func getCategorieFromId(categoryId: Int) -> String {
        return categoryList.first(where: { $0.id == categoryId } )?.name ?? ""
    }
    
    func fetchAllProducts() {
        self.delegate?.willMakeRequest()
        self.cancellable = WebService.sharedService.fetchAllProducts()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.delegate?.didFinishRequestWithError(errorDescription: error.localizedDescription)
                case .finished:
                    self.delegate?.didMakeSuccessfullRequest()
                }
            }, receiveValue: { products, categories in
                self.productList = products
                self.categoryList = categories
            })
    }
}
