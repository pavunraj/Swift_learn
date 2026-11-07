//
//  ProductListViewModel.swift
//  HAQ
//
//  Created by PavunRaj on 03/07/26.
//

import Foundation
import Combine

@MainActor
class ProductListViewModel: ObservableObject {
    
    var respository: ProductRespositoryImplementation
    @Published var productdata: [Product] = []
    init(respository: ProductRespositoryImplementation = ProductRespositoryImplementation(networkManager: NetworkManager())) {
        self.respository = respository
    }
    
    func fetchData() {
        Task {
            let response = try await respository.getProduct()
            productdata = response
            

        }
    }
}
