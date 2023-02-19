//
//  WebServiceTests.swift
//  LeBonCoinTests
//
//  Created by Zakaria El Moutassim on 16/02/2023.
//

import XCTest
import Combine
@testable import LeBonCoin

final class WebServiceTests: XCTestCase {
    
    var sut: WebService!
    private var cancellable: AnyCancellable?

    override func setUpWithError() throws {
        sut = WebService()
    }
    
    func testFetchAllProducts() {
        let expection = XCTestExpectation(description: "Products are fetched")
        var responseError: Error?
        var responseProducts: [Product]?
        var responseCategory: [Categorie]?
        
        cancellable = sut.fetchAllProducts().sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                responseError = error
            case .finished: print("Publisher is finished")
            }
        }, receiveValue: { products, categories in
            responseProducts = products
            responseCategory = categories
            expection.fulfill()
        })
        wait(for: [expection], timeout: 1)
        XCTAssertNil(responseError)// Make sure that error == nil
        XCTAssertNotNil(responseProducts) // Make sure that responseProducts != nil
        XCTAssertNotNil(responseCategory) // Make sure that responseCategory != nil
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
}
