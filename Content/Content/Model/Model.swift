//
//  Model.swift
//  Content
//
//  Created by PavunRaj on 31/10/26.
//

import Foundation

struct Contents: Identifiable, Equatable, Sendable, Codable {
    let code: String
    var name: String
    let areaSqKM: Int
    let population: Int
    let lines: [String]
    let countries: Int
    let oceans: [String]
    let developedCountries: [String]
    var id: String {
        code
    }
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case name = "name"
        case areaSqKM = "areaSqKm"
        case population = "population"
        case lines = "lines"
        case countries = "countries"
        case oceans = "oceans"
        case developedCountries = "developedCountries"
    }
}

typealias ListContent = [Contents]
