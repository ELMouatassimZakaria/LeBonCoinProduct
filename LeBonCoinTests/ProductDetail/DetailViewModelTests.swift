//
//  DetailViewModelTests.swift
//  LeBonCoinTests
//
//  Created by Zakaria El Moutassim on 19/02/2023.
//

import XCTest
@testable import LeBonCoin

final class DetailViewModelTests: XCTestCase {
    
    func testDetailsViewModel() {
        // Create a mock ProductWithCategory object
        let productWithCategory = (product: LeBonCoinMocker.product, category: LeBonCoinMocker.categorie.name)

        // Create a DetailsViewModel object with the mock ProductWithCategory object
        let viewModel = DetailsViewModel(detailsProduct: productWithCategory)
        
        // Test the properties of the viewModel
        XCTAssertEqual(viewModel.imageUrl, "test_thumb_url")
        XCTAssertEqual(viewModel.price, "10 €")
        XCTAssertEqual(viewModel.titleProduct, "Test Product")
        XCTAssertEqual(viewModel.productDescription, "Test Description")
        XCTAssertEqual(viewModel.category, "Informatique")
    }
}
