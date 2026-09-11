//: [Previous](@previous)

import Foundation

// MARK: - Map function
var item = ["Hello", "playground", "Welcome"]
print(item.map{$0.lowercased()})

// Manual higher order

for itemList in item {
    print(itemList.lowercased())
}

// Use model

struct UserDetails {
    let name, address, email: String?
}

var userItem = [
UserDetails(name: "pavun", address: "salem", email: "pavun@gmail.com"),
UserDetails(name: "pavunraj", address: "chennai", email: "pavunraj@gmail.com"),
UserDetails(name: "pavunvarshith", address: "bangalore", email: nil),
]

let userName = userItem.map({$0.name})
let upperCase = userName.description.uppercased()
let userEmail = userItem.map {$0.email}
print("Model mapping",userName,"Convert upper case",upperCase,"\nUserEmail:-",userEmail)

//MARK: - Compact map

//Remove nil value
let removeNilValueEmail = userItem.compactMap { $0.email }
print("remove nil value:",removeNilValueEmail)

struct User {
    var userName: String?
    var perUnitAmount: Double
    var totalTransactionAmount: Int
}

var salesAccountDetails = [User(userName: "Pavun", perUnitAmount: 11.0, totalTransactionAmount: 3456),
                                User(userName: "Pavun2", perUnitAmount: 14.0, totalTransactionAmount: 11256),
                                User(userName: "Pavun3", perUnitAmount: 16.0, totalTransactionAmount: 34356)
                               ,User(userName: "Pavun4", perUnitAmount: 19.0, totalTransactionAmount: 986)
                           ,User(userName: nil, perUnitAmount: 19.0, totalTransactionAmount: 986)
                           ,User(userName: "Pavun5", perUnitAmount: 0.0, totalTransactionAmount: 986)
]


// Filter
var filterAmount = salesAccountDetails.filter { $0.totalTransactionAmount > 1000 }.map { $0.userName}
print("FilterAmount",filterAmount)

// for loop apply

var filterContent: [Int] = []

let afterFilter = salesAccountDetails.forEach { /// forEach is not return anything  its void
    if $0.totalTransactionAmount > 1000 {
        filterContent.append($0.totalTransactionAmount)
    }
}


print("afterFilter:, \(afterFilter)")
print("filterContent:, \(filterContent)")

// Map

//var foundUnitPrice = salesAccountDetails.map { $0.perUnitAmount }
//print("foundUnitPrice", foundUnitPrice)
//
//var upperCaseName = salesAccountDetails.map { $0.userName!.uppercased() }
//print("upperCaseName", upperCaseName)

var mulitplyAmount = salesAccountDetails.map { $0.perUnitAmount * 1000 }.compactMap { $0 > 1000 ? $0 : nil }
print("mulitplyAmount", mulitplyAmount)


// Reduce
/// sum of total values
///
var newArra = [2, 4, 6, 8, 11, 43, 5]
print("Sum",newArra.reduce(0, +))
print("Mul",newArra.reduce(1, *))
print("Another munim",newArra.reduce(100, -))


let total = salesAccountDetails.reduce(0.0) {
    $0 + $1.perUnitAmount + Double($1.totalTransactionAmount)
}


// Flatmap
let flatArr: [[Int]] = [[1,2,3,4],[4,6,8,41], [11,21,13,14], [12,32,43,44]]
let flatMap = flatArr.flatMap { $0 }
print(flatMap)


// Array VS Set

var swiftUIDevs: Set = ["Sean", "James"]
var swiftDevs: Set = ["Sean","James", "Olivia", "Maya", "Leo"]
var kotlinDevs: Set = ["Olivia","Elijah","Leo","Maya","Dan"]
var experiencedDevs: Set = ["Sean", "Ava", "Olivia","Leo" ]

var differene = swiftDevs.subtracting(experiencedDevs)
print(differene)

var bothOfSame = swiftDevs.intersection(experiencedDevs)
print(bothOfSame)

var onlyInSwift = swiftDevs.symmetricDifference(experiencedDevs)
print(onlyInSwift)

var disJOint = swiftUIDevs.isDisjoint(with: swiftDevs)

// Optional

struct User2 {
    var name: String?
    let age: Int?
}
let user2 = User2(name: "Pavun", age: 22)

// IF let


if let age = user2.age {
    print("user age \(age)")
} else {
    print("No age found")
}

// Guard let

func foundAge(_ age: Int?) {
    guard let age else { return }
    
    print("Find the age at \(age)")
}

foundAge(user2.age)


// Nil coalesing

let name = user2.name ?? "Unknown"
print("User name is \(name)")

// Foce unwrapping

let name2 = user2.name!

print("User name is \(name2)")

// Optional chaining

var userList: User2? = User2(name: "ds", age: 21)
userList?.name = "dd"
print("UserList",userList?.name ?? "UnKnow")
