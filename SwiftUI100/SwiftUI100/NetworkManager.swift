//
//  NetworkManager.swift
//  SwiftUI100
//
//  Created by PavunRaj on 27/06/26.
//

import Foundation
import SwiftUI
import Combine


final class NetworkManager {
    let baseURL = URL(string:  "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")

    let decode: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return JSONDecoder()
    }()
    func request<T: Codable>() -> some Publisher<T, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: baseURL!)
            .map(\.data)
            .decode(type: T.self, decoder: decode)
    }
}
