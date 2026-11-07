//
//  ContentView.swift
//  Content
//
//  Created by PavunRaj on 31/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var vm = ContentViewModel()
    var body: some View {
        NavigationStack {
            List(vm.list) {  listName in
                Text("\(listName.name)")
            }
            
            Button("Add") {
                
                for index in vm.list.indices {
                    vm.list[index].name.append("Hello pavun")
                }
              
            }
            
            .task {
                vm.fetchContentList()
            }
            .navigationTitle("Name list")
        }
       
    }
}

#Preview {
    ContentView()
}
