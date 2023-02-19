//
//  WebService.swift
//  LeBonCoin
//
//  Created by Zakaria El Moutassim on 14/02/2023.
//

import Foundation
import Combine

class WebService {
    
    static let sharedService = WebService()
    
    func fetchAllProducts() -> AnyPublisher<([Product], [Categorie]), Error> {
        guard let productUrl = URL(string: baseUrl + "/listing.json"), let categoryUrl = URL(string: baseUrl + "/categories.json") else {
            fatalError("Invalid Url")
        }
        
        let productPublisher = URLSession.shared.dataTaskPublisher(for: productUrl)
            .map { $0.data }
            .decode(type: [Product].self, decoder: JSONDecoder())
        
        let categoryPublisher = URLSession.shared.dataTaskPublisher(for: categoryUrl)
            .map { $0.data }
            .decode(type: [Categorie].self, decoder: JSONDecoder())
        
        return Publishers.Zip(productPublisher, categoryPublisher)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
