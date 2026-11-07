//
//  ContentView.swift
//  SwiftUI100
//
//  Created by PavunRaj on 27/06/26.
//

import SwiftUI

struct ContentView: View {
  @State  private var vm = FetchUserDataViewModel()
    var body: some View {
            NavigationStack {
                List {
                    ForEach(vm.upcomingMovies) { movie in
                        Text("Name: \(movie.title)")
                    }
                }
                .navigationTitle("Movie List")
                
                .onAppear(perform: {
                    vm.requestList()
                })
            }
            .padding(.bottom, 10)
    }
}

#Preview {
    ContentView()
}
