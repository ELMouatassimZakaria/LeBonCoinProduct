//
//  ProductListViewModelTests.swift
//  LeBonCoinTests
//
//  Created by Zakaria El Moutassim on 17/02/2023.
//

import XCTest
@testable import LeBonCoin

final class ProductListViewModelTests: XCTestCase {
    
    var viewModel: ProductListViewModel!
    var view: ProductListViewModelDelegateMock!
    
    override func setUp() {
        super.setUp()
        view = ProductListViewModelDelegateMock()
        viewModel = ProductListViewModel(delegate: view)
    }
    
    func testFetchAllProduct() {
        let expectation = XCTestExpectation(description: "Fetch Products expectation")
        viewModel.fetchAllProducts()
        // Delay the fulfillment of the expectation
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        XCTAssertTrue(viewModel.productList.count > 0)
        XCTAssertTrue(viewModel.categoryList.count > 0)
        XCTAssertTrue(view.didStartRequestCalled)
        XCTAssertTrue(view.didSuccessRequestCalled)
        XCTAssertFalse(view.didFailRequestCalled)
    }
    
    func testGetCategorieFromId() {
        let catgorie = LeBonCoinMocker.categorie
        
        viewModel.categoryList = [catgorie]
        let categoryId = 2
        let categoryName = viewModel.getCategorieFromId(categoryId: categoryId)
        XCTAssertEqual(categoryName, "Informatique")
    }
}
