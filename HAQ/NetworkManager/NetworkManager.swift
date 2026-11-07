//
//  NetworkManager.swift
//  HAQ
//
//  Created by PavunRaj on 03/07/26.
//

import Foundation

protocol NetworkManagerProtocol {
    func request<T: Decodable>(_ endPoint: APIEndPoints, body: Encodable?, response: T.Type ) async throws -> T
}

final class NetworkManager: NetworkManagerProtocol {
    func request<T>(_ endPoint: APIEndPoints, body: Encodable? = nil, response: T.Type) async throws -> T where T : Decodable {
        guard let url = URL(string: "https://reqres.in/api/users") else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = endPoint.httpMethod.rawValue
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
       
        if let body {
            
            request.httpBody =
            try JSONEncoder().encode(AnyEncodable(body))
            
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let response = response as? HTTPURLResponse, response.statusCode != 200 {
            throw APIError.serverError
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingError
        }
    }
    
  
}


struct AnyEncodable: Encodable {
    private var encodeFuc: (Encoder) throws -> Void
    
    init<T: Encodable>(_ wrapped: T) {
        encodeFuc = wrapped.encode
    }
    
    func encode(to encoder: Encoder) throws {
        try encodeFuc(encoder)
    }
}


