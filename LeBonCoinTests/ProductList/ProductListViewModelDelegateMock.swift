//
//  ProductListViewModelDelegateMock.swift
//  LeBonCoinTests
//
//  Created by Zakaria El Moutassim on 17/02/2023.
//

import Foundation
@testable import LeBonCoin

class ProductListViewModelDelegateMock: ProductListViewModelDelegate {
    
    var didStartRequestCalled = false
    var didSuccessRequestCalled = false
    var didFailRequestCalled = false

    func willMakeRequest() {
        didStartRequestCalled = true
    }
    
    func didMakeSuccessfullRequest() {
        didSuccessRequestCalled = true
    }
    
    func didFinishRequestWithError(errorDescription: String) {
        didFailRequestCalled = true
    }
}
