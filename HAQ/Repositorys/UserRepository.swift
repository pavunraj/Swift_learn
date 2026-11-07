//
//  UserRepository.swift
//  HAQ
//
//  Created by PavunRaj on 03/07/26.
//

import Foundation

protocol ProductRepository {
    func getProduct() async throws -> [Product]
}


class ProductRespositoryImplementation: ProductRepository {
   
    
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    
   
    func getProduct() async throws -> [Product] {
       // try await networkManager.request(APIEndPoints.productlist, response: Product.self)
        
        let product = Product(name: "Macbook", type: "Laptop", price: 4000.00)
        return [product]
    }
}
