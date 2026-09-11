import UIKit
import Combine
import SwiftUI
import Foundation

var greeting = "Hello, playground"

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
var baseURL = "https://newsapi.org/v2/everything?q=tesla&from=2024-02-24&sortBy=publishedAt&apiKey=7ad11043cb8e404b92184f54e5c47ef0"

struct Posts: Decodable {
    let id: Int
    let title: String
    let userId: Int
    let body: String
    

}

struct Article: Codable, Identifiable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: URL
    let urlToImage: URL?
    let publishedAt: String
    let content: String?

    var id: String {
        return url.absoluteString
    }
}

struct Source: Codable {
    let id: String?
    let name: String
}

struct NewsModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}



let dataPublisher = URLSession.shared.dataTaskPublisher(for: URL(string:baseURL )!)
//let dataPublisher = URLSession.shared.dataTaskPublisher(for: url)
    .map{ $0.data }
    .decode(type: NewsModel.self, decoder: JSONDecoder())
let canecelPublisher = dataPublisher
    .sink { (completion) in
        //print("Completion is \(completion)")
    } receiveValue: { value in
       // print("The tile is \(value[0].title)")
        print("The body is \(value.articles[0].author)")
        
       // print("Hiiii",value[0].articles)
    }


// .sink and .assign the for subscriber


[3, 7, 10]
    .publisher
    .sink { value in
     //   print("Item \(value)")
    }


let label = UILabel()
Just("Hey pavun")
    .map {"My name is \($0) "}
    .assign(to: \.text, on: label)


// Passthrough - subcriber

let subject = PassthroughSubject<Int, Never>()
let subscription = subject
    .sink { print ($0) }

subject.send(40)

Just(30)
    .subscribe(subject)

// CurrentSubcription - subcriber

let currentSubject = CurrentValueSubject<String, Never>(" I am here")

let anotherScbscription = currentSubject

    .sink {print("Hi \($0)")}

currentSubject.send("Hoeelo")
currentSubject.send("The counter")


// Future and Just for Publisher


enum FutureError: Error {
    case noMultiple
}

let future = Future<String,FutureError> { promise in
    
    let calender = Calendar.current
    let seconds = calender.component(.second, from: Date())
    print("Second is \(seconds)")

    if seconds.isMultiple(of: 3) {
        promise(.success("We successed of \(seconds)"))
    } else {
        promise(.failure(.noMultiple))
    }
}.catch({ error in
    Just("Catch the error")
})

    .delay(for: .init(1), scheduler: RunLoop.main)
    .eraseToAnyPublisher()


future.sink { print($0) } receiveValue: {print($0)}


// Challanges
let textFiled = UITextField()

let array = [true, false, false, true]
let publisher1 = array.publisher

let subscription1 = publisher1.assign(to: \.isEnabled, on: textFiled)
textFiled.publisher(for: \.isEnabled).sink(receiveValue: {print($0)})
print("-----------")

_ = publisher1.dropFirst(1)
    .sink(receiveValue: {print($0)})


// call back REST API with Error


enum APIError: Error {
    case networkError (error: String)
    case responseError (error: String)
    case UnknowError (error: String)
}


let urlReq = URL(string: "https://jsonplaceholder.typicode.com/posts")

let publisherReq = URLSession.shared.dataTaskPublisher(for: urlReq!)

let cancellableSink = publisherReq
    .map({$0.data})
    .decode(type: Array<Posts>.self, decoder: JSONDecoder())

    .mapError({ error -> Error in
        switch error {
        case URLError.cannotFindHost:
            return APIError.networkError(error: "Invalid url")
        default:
            return APIError.responseError(error: error.localizedDescription)
        }
    })
    .sink { completion in
        print(String(describing: completion))
    } receiveValue: { response in
        print(response[1].id)
    }

Just(2)
    .tryMap { _ in
        throw APIError.UnknowError(error: "UnKonwError")
    }


// Chanllenges

let emptyPosts = Posts(id: 0, title: "Empty", userId: 0, body: "Empty pody")



let publisherReq1 = URLSession.shared.dataTaskPublisher(for: urlReq!)
let queue = DispatchQueue(label: "a queue")
let cancellableSink1 = publisherReq
    .map({$0.data})
    .decode(type: Array<Posts>.self, decoder: JSONDecoder())
   // .receive(on: DispatchQueue.main)
   // .subscribe(on: DispatchQueue(label: "A queue"))
    //.map({$0.first})
//    .replaceNil(with: emptyPosts)
//    .compactMap({$0.title})
    .mapError({ error -> Error in
        switch error {
        case URLError.cannotFindHost:
            return APIError.networkError(error: "Invalid url")
        default:
            return APIError.responseError(error: error.localizedDescription)
        }
    })
    .sink { completion in
        print(String(describing: completion))
        print("Thread on main: \(Thread.current.isMainThread)")
        print("Publisher Thread is Info: \(Thread.current)")
    } receiveValue: { response in
       // print(response)
        print("Thread on main: \(Thread.current.isMainThread)")
        print("Publisher Thread is Info: \(Thread.current)")
    }


// BackPressure

// control how mush of amount flow

var cityPublisher = ["Salem", "Erode", "Chennai", "Bangalore", "Kanchipuram"].publisher



final class CitySubcriber: Subscriber {
    typealias Input = String
    
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: Input) -> Subscribers.Demand {
        print("City \(input)")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completion \(completion)")
    }
}

    
var cancelpublisher = cityPublisher
//    .sink { city in
//        print("City : \(city)")
//    }
var citySubscriobtion = CitySubcriber()
cityPublisher.subscribe(citySubscriobtion)

print("------------------------")

// Leverage combine advanced

let numbers = (1...20)
    .publisher

let numbersTwo = (21...40)
    .publisher

let words = (21...40).compactMap { String($0) }
    .publisher

let cancellableSink2 = numbers

    //.last(where: {$0 < 20})
    //.filter {$0 % 2 == 0}
    //.compactMap{value in Float(value)}
    //.first()
    //.last(where: {$0 < 20 })
    //.dropFirst()
    //.drop(while: {$0 % 3 == 0} )
    //.prefix(4)
    //.prefix(while: {$0 < 5})
    //.append(21,22,23)
    //.prepend(21,22,23)
    //.merge(with: numbersTwo)
  //  .combineLatest(words)
    //.zip(numbersTwo)
    //.collect()
    //.throttle(for: .seconds(2), scheduler: DispatchQueue.main, latest: true)
    .sink {print($0)}
print("-----------------------")



let firstWord = (1...30)
    .publisher

let secondWord  = (20...40)
    .publisher

let cancelPublisher3 = firstWord
   // .combineLatest(secondWord)
    .throttle(for: 2.0, scheduler: DispatchQueue.main, latest: true)
    .sink(receiveValue: {print($0)})

// Challanges


let itemWord = ["One", "Two", "Three", "four", "Five", "Six"]
    .publisher

    .eraseToAnyPublisher()
final class  itemSubscriber: Subscriber {
    
    typealias Input = String
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.max(3))
        print("Subscription : \(subscription)")
        
    }
    func receive(_ input: String) -> Subscribers.Demand {
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("After completion : \(completion)")
    }
}
//
//let itemPublisher = itemWord
//    .throttle(for: .second(2.0), scheduler: DispatchQueue.main, latest: true)

// ------------------------------------


let queue1  = DispatchQueue(label: "Queue")
let numberssPublisher = (1...100)
    .publisher

    .delay(for: 2.0, scheduler: queue)

final class numberSubscription : Subscriber {
    
    typealias Input = Int
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.max(3))
    }
    
    func receive(_ input: Int) -> Subscribers.Demand {
        print("Number:  \(input)")
        return.none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completion")
    }
}

let numberSub = numberSubscription()
numberssPublisher.subscribe(numberSub)
var articlesCount = 0
   var error: Error?

    
func fetchData() {
    URLSession.shared.dataTaskPublisher(for: URL(string: baseURL)!)
        .map(\.data)
        .decode(type: [NewsModel].self, decoder: JSONDecoder())
        .sink { completion in
            if case .failure(let error) = completion {
//                self.error = error
                print("error")
            }
        } receiveValue: { response in
           articlesCount = response[0].articles.count
            print("sdfasdfds",articlesCount)
        }
       // .store(in: &cancellables)
}
