//
//  main.swift
//  CoimbinePlayground
//
//  Created by PavunRaj on 08/03/24.
//

import Foundation
import Combine

// Publishcer

let _ = Just("Hello world")

    .sink { (value) in
        print("Value is \(value)")
    }

// NotificationCenter

let notification = Notification(name: .NSSystemClockDidChange,object:  nil, userInfo: nil)
let notificationCenter = NotificationCenter.default.publisher(for: .NSSystemClockDidChange)

    .sink { (value) in
        print("Value name  is \(value)")
    }
 NotificationCenter.default.post(notification)


// Map

[1, 5, 9]

    .map { $0 * $0 }
    .publisher.sink { completion in
        print("completion \(completion)")
    } receiveValue: { (value) in
        print("value is \(value)")
    }
print("---------------------")
// Use the decode() with map to convert a REST response to an object

let url1 = URL(string: "https://jsonplaceholder.typicode.com/posts")!

struct Posts: Decodable {
    let id: Int
    let title: String
    let userId: Int
    let body: String
}

let dataPublisher1 = URLSession.shared.dataTaskPublisher(for: url1)
    .map{ $0.data }
    .decode(type: [Posts].self, decoder: JSONDecoder())
let canecelPublisher = dataPublisher1
    .sink { (completion) in
        print("Completion is \(completion)")
    } receiveValue: { value in
        print("The tile is \(value[0].title)")
    }



//(2) Use `decode()` with `map()` to convert a REST respones to an object
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

struct Task: Decodable {
    let id: Int
    let title: String
    let userId: Int
    let body: String
}
let dataPublisher = URLSession.shared.dataTaskPublisher(for: url)
    .map{$0.data}
    .decode(type: [Task].self, decoder: JSONDecoder())
let cancellableSink = dataPublisher
.sink(receiveCompletion: { completion in
    print(completion)
}, receiveValue: { items in
    print( "Result \(items[0].title)")
})
