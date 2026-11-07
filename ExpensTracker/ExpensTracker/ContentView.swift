//
//  ContentView.swift
//  ExpensTracker
//
//  Created by PavunRaj on 03/07/26.
//

import SwiftUI

struct ContentView: View {
    @State var shoppingList: [PurchaseItems] = [PurchaseItems(item: "Food", price: 12.0, totalPrice: 12.0),PurchaseItems(item: "shop", price: 123.0, totalPrice: 1234.0),PurchaseItems(item: "shop2", price: 123.0, totalPrice: 1234.0), PurchaseItems(item: "shop35", price: 123.0, totalPrice: 1234.0)]

    var body: some View {
        VStack {
            List(shoppingList) { item in
                Text(item.item.lowercased())
            }
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
