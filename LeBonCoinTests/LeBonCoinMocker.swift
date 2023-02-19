//
//  LeBonCoinMocker.swift
//  LeBonCoinTests
//
//  Created by Zakaria El Moutassim on 17/02/2023.
//

import Foundation
@testable import LeBonCoin


public class LeBonCoinMocker {
    
    static var product: Product {
        let product = Product(id: 123, categoryID: 2,
                              title: "Test Product", productDescription: "Test Description",
                              price: 10, imagesURL: ImagesURL(small: "test_small_url", thumb: "test_thumb_url"),
                              creationDate: "2019-10-16T17:10:20+0000",
                              isUrgent: false, siret: "")
        return product
    }

    static var categorie: Categorie {
        let categorie = Categorie(id: 2,
                                  name: "Informatique")
        return categorie
    }
}
