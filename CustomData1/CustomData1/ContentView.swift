//
//  ContentView.swift
//  CustomData1
//
//  Created by PavunRaj on 14/10/26.
//

import SwiftUI

struct ContentView: View {
    @State var countryViewModel = CountryViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                List(countryViewModel.countries, id: \.name) { value in
                    
                    NavigationLink(destination: ContryDetails(country: value.name)) {
                        Text(value.name)
                    }
                }
                .onAppear {
                    countryViewModel.fetchCountry()
                }
//                .task {
//                    
//                }
            }
            .navigationTitle("Countrys")
        }
        //.padding()
    }
}

#Preview {
    ContentView()
}



struct ContryDetails: View {
    @State var country: String
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(country)
            }
            .navigationTitle("Country Details")
        }
        
    }
}


