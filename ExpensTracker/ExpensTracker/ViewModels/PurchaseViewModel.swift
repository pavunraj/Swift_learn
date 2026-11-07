//
//  PurchaseViewModel.swift
//  ExpensTracker
//
//  Created by PavunRaj on 03/07/26.
//

import Foundation
import Combine

final class PurchaseViewModel: ObservableObject {
    @Published var items:[PurchaseItems] = []
    
    func addItem(on name: String, at price: Double) {
//        var totalPrice = items.map {$0.totalPrice}
//        var newTotalPrice += totalPrice
        //items.append(PurchaseItems(item: name, price: price, totalPrice: <#Double#>))
    }
}
