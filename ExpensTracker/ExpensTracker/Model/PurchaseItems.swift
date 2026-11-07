//
//  PurchaseItems.swift
//  ExpensTracker
//
//  Created by PavunRaj on 03/07/26.
//

import Foundation

struct PurchaseItems: Identifiable {
    let id = UUID()
    let item: String
    let price: Double
    let totalPrice: Double
}
