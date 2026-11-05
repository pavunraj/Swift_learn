//
//  CountryViewModel.swift
//  CustomData1
//
//  Created by PavunRaj on 14/10/26.
//

import Foundation
import Combine

@Observable
class CountryViewModel {
    
    var countries = [Country]()
    
   
    
    func fetchCountry() {
        countries.removeAll()
        countries.append(Country(name: "India"))
        countries.append(Country(name: "India2"))
        countries.append(Country(name: "India3"))
        countries.append(Country(name: "India4"))
        countries.append(Country(name: "India5"))
    }
    
}


// with network

class ViewModel {
    
    private let url = URL(string: "")
    private let decoder = JSONDecoder()
    
    @Published var countries: [Country] = []
    
    init() {
        fetchRequest()
    }
    
    func fetchRequest() {
        URlSession.shared.dataTaskPublisher(for: url!)
            .map(\.data)
            .decode(type: [Country].self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .assign(to: &countries)
    }
}
