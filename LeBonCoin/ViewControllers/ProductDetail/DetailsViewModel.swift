//
//  DetailsViewModel.swift
//  LeBonCoin
//
//  Created by Zakaria El Moutassim on 14/02/2023.
//

import UIKit

typealias ProductWithCategory = (product: Product, category: String)

class DetailsViewModel: ViewModel {

    var detailsProduct: ProductWithCategory
 
    init(detailsProduct: ProductWithCategory) {
        self.detailsProduct = detailsProduct
    }
    
    var imageUrl: String {
        return detailsProduct.product.imagesURL.thumb ?? ""
    }
    
    var price: String {
        return "\(detailsProduct.product.price.description) €"
    }
    
    var titleProduct: String {
        return detailsProduct.product.title
    }
    
    var productDescription: String {
        return detailsProduct.product.productDescription
    }
    
    var category: String {
        return detailsProduct.category
    }
    
    var isUrgent: Bool {
        return detailsProduct.product.isUrgent
    }
}
