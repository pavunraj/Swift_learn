//: [Previous](@previous)

import Foundation

enum Test {
    case string; case bool; case int; case float
}


class Problem {
    
    func findInput(with input:Test) {
        
        switch input {
            
        case .string:
            print("Its string")
        case .bool:
            print("It's bool")
        case .int:
            print("It's int")
        case .float:
            print("It's float")
        }
    }
}


let problem = Problem()
problem.findInput(with: Test.bool)


// Associated with some value


enum NetworkRequest {
    case get(url: URL)
    case post(url: URL, headers: [String: String], body: Data)
}

/*
class APIHandler {
    
    func sendRequest(_ request: NetworkRequest) {
        var urlRequest = URLRequest(url: request.url)
        switch request {
        case .get:
            urlRequest.httpMethod = "GET"
        case let .post(_, headers, body):
            urlRequest.httpMethod = "POST"
            urlRequest.allHTTPHeaderFields = headers
            urlRequest.httpBody = body
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            // Handle the response or error
        }.resume()
    }
}

*/


// Enums can used to store a value


enum Shape {
    case circule(radius:Double)
    case rectangle(width:Double, height:Double)
    case triangle(base:Double, height:Double)
}

func calculateArea(of shape:Shape) -> Double {
    
    switch shape {
    case let .circule(radius):
        return .pi * radius * radius
    default:
        return 0.0
    }
}

let circule = Shape.circule(radius: 2.0)
print(calculateArea(of: circule))
