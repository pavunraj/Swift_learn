//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//Single responsibility principle
// open and closed principle
// liskvo substitution
// Interface segregation
// Depandancy Inversion principle


struct CommentModel: Codable, Identifiable {
    let postID, id: Int?
    let name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}


enum DemoError: Error {
    case badURL
    case noData
    case decodeError
}
class NetworkManager {
    
}

class APIHandler {
    func getComments(url: URL,completion: @escaping(Result< Data, DemoError>) -> Void ) {
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            completion(.success(data))
        })
        .resume()
    }
}

class ResponseHandler {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        try JSONDecoder().decode(type, from: data)
    }
}
