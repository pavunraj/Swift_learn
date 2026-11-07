//
//  MovieListViewModel.swift
//  SwiftUI100
//
//  Created by PavunRaj on 27/06/26.
//

import Foundation
import SwiftUI
import Combine

@Observable
final class FetchUserDataViewModel {
    var upcomingMovies: [Movie] = []
    var networkManaer: NetworkManager
    var cancellables = Set<AnyCancellable>()
    init(networkManaer: NetworkManager = NetworkManager()) {
        self.networkManaer = networkManaer
    }
    
    func requestList() {
        networkManaer.request()
            .map(\MovieResponse.results)
           // .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .sink(receiveValue: { [weak self]  in
                self?.upcomingMovies = $0
            })
            .store(in: &cancellables)
                
    }
}


struct MovieResponse: Codable {

    let dates: Dates?
    let page: Int?
    let results:[Movie]
}

struct Dates: Codable {
    let maximum, minimum: String?
}


struct Movie: Codable, Equatable, Identifiable {
    
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    var posterURL: URL? {
        posterPath.map { URL(string: "https://image.tmdb.org/t/p/w400/\($0)")! }
    }
}
let apiKey = "da9bc8815fb0fc31d5ef6b3da097a009"
