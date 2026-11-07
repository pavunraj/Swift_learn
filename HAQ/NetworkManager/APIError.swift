//
//  APIError.swift
//  HAQ
//
//  Created by PavunRaj on 03/07/26.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError
}

struct APIResponseError: Codable {
    let message: String
}
