//
//  ProductDetailsView.swift
//  HAQ
//
//  Created by PavunRaj on 03/07/26.
//

import SwiftUI

struct ProductDetailsView: View {
    @StateObject var vm = ProductListViewModel()
    var body: some View {
        Text("Hello, World!")
        List {
            ForEach(vm.productdata) { name in
                Text(name.name)
                Text("\(name.price)")
            }
        }
            .task {
                  vm.fetchData()
            }
    }
}

#Preview {
    ProductDetailsView()
}
