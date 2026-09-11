//: [Previous](@previous)

import Foundation
import UIKit


// Refer my microsoft one note for better understanding
protocol CustomViewControllerProtocol {
    func configure()
}


class HomeVC: UIViewController, CustomViewControllerProtocol {
    func configure() {
        view.backgroundColor = .white
        title = "Home"
    }
}

class ProfileVC: UIViewController, CustomViewControllerProtocol {
    func configure() {
        view.backgroundColor = .white
        title = "Profile"
    }
}


class DashboardVC: UIViewController {
   
    func makeViewController(for type: String) ->  CustomViewControllerProtocol {
        
        switch type {
        case "home":
            return HomeVC()
        case "profile":
            return ProfileVC()
        default:
            return HomeVC()
        }
    }
   
}

let integerNumber = [
    "Prime" : [2, 3, 5, 7, 11, 13],
    "Fibonacci" : [1, 1, 2, 3, 5, 8],
    "Square" : [1, 4, 9, 16, 25]
]

var largestNumber = 0

for (key, value) in integerNumber {
    print("\(key) : \(value)")
    for number in value {
        if number > largestNumber {
            largestNumber = number
        }
    }
}

print("Largest Number : \(largestNumber)")


var n = 2

while n < 100 {
   
    n *= 2
}
print(n)

var m = 2

repeat {
    m *= 2
} while m < 0

print(m)


var total = 0

for i in 0..<4 {
    print("#i", i)
    total += i
    print(total)
    print("-------")
}

print("Total : \(total)")


func calculateStatistics(numbers: [Int]) -> ( min: Int, max: Int, sum: Int) {
    
    var minValue = numbers[0]
    var maxValue = numbers[0]
    var sumValue = 0
    
    for value in numbers {
        
        if value < minValue {
            minValue = value
        } else if value > maxValue {
            maxValue = value
        }
        sumValue += value
    }
    return (minValue, maxValue, sumValue)
}


let stats = calculateStatistics(numbers: [1, 5, 3, 7, 2])
print("Min: \(stats.min)")
print("Max: \(stats.max)")
print("Sum: \(stats.sum)", stats.2)



func returnFifteen() -> Int {
    
    var x = 10
    func add () {
        x += 5
    }
    add()
    return x
}

returnFifteen()
print("Returned value:", returnFifteen())

print("Function are return another function")

func makeIncrement(on input: Int) -> ((Int) -> (Int)) {

    func doIncrement(value: Int) -> Int {
        return 1 + value
    }
    
    return doIncrement
}


let incrementByOne = makeIncrement(on: 10)
print(incrementByOne)


func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(122))



// Use of typealias


public protocol IteratorProtocol {
    associatedtype Element
}

protocol Sequence  {
    associatedtype iterator: IteratorProtocol
    typealias Element = iterator.Element
    
}


// Define the iterator
struct NumberIterator: IteratorProtocol {
    typealias Element = Int
    private var current = 1
    private let end = 3

    mutating func next() -> Int? {
        guard current <= end else { return nil }
        defer { current += 1 }
        return current
    }
}

// Define the sequence
struct NumberSequence: Sequence {
    typealias iterator = NumberIterator

    func makeIterator() -> NumberIterator {
        return NumberIterator()
    }
}

// Use the sequence
let sequence = NumberSequence()
var iterator = sequence.makeIterator()

while let number = iterator.next() {
    print("# Hello: ",number)
}

//

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            print("#lessThanTen: ",item)
            return true
        }
    }
    return false
}

func lessThanTenNumber(number: Int) -> Bool {
    return number < 10
}

let numbers = [20, 19, 7, 12]
if hasAnyMatches(list: numbers, condition: lessThanTenNumber) {
    print("#contains a number less than 10")
} else {
    print("#does not contain a number less than 10")
}


numbers.map({ (number: Int) -> Int in
    
    let result = 3 * number
    print("Result:",result)
    return result
})

print("* After map :",numbers)

// Another way closure omit the parameter

let mappedNumber = numbers.map({ number in 3 * number})
print("# Mapped Number is:", mappedNumber)


// Class and objects

class Shape {
    var numberOfSides: Int = 0
    
    func simpleDescription() -> String{
        return "A shape of number of sides is \(numberOfSides)"
    }
}

var shape = Shape()
shape.numberOfSides = 7
print("# Shape description:", shape.simpleDescription())


class NamedShape {
    
    var numberOfSides =  0
    var name: String
    
    init(myname: String) {
        self.name = myname
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides - \(name)."
    }
}

class Square: NamedShape {
    
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(myname: name)
        numberOfSides = 12
    }
    
    override func simpleDescription() -> String {
        super.simpleDescription()
        + "\nSquare has side length \(sideLength) & \(numberOfSides) sides."
    }
}


var square = Square(sideLength: 11.0, name: "Pavun")
print("#",square.simpleDescription())


class EquilateralTriangle: NamedShape {
    
    var sideOfLength = 0.0
    
    init(sideOfLength: Double = 0.0, name: String) {
        self.sideOfLength = sideOfLength
        super.init(myname: name)
        numberOfSides = 10
    }
    
    var calculateArea: Double {
        
        get {
            return  2.0 * sideOfLength
        }
        
        set {
            sideOfLength = newValue / 3.0
        }
    }
    
    func sampleDescription() {
        print(" EquilateralTriangle:", calculateArea, sideOfLength)
    }
}

var equilateralTriangle = EquilateralTriangle(sideOfLength: 10.0, name: "PavunRaj")

equilateralTriangle.calculateArea
equilateralTriangle.sampleDescription()
equilateralTriangle.calculateArea = 30
equilateralTriangle.sampleDescription()


enum Rank: String, CaseIterable, CustomStringConvertible {
    var description: String {
        return sampleDescription()
    }
    
    case ace = "1"
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func sampleDescription() -> String {
        
        switch self {
        case .ace:
            return "Ace"
        case .two:
            return "Two"
        case .three:
            return "Three"
        default:
            return String(self.rawValue)
        }
    }
}

let ace: Rank = .jack
let aceDescription = ace.rawValue
print("aceDescription",aceDescription)

enum Suit: CaseIterable, CustomStringConvertible {
    var description: String {
        return sampleDescription()
    }
    
    
    case spades, hearts, diamonds, clubs
    
    func sampleDescription() -> String {
        switch self {
        case .spades:
            return "Spades"
        case .hearts:
            return "Hearts"
        case .diamonds:
            return "Diamonds"
        case .clubs: return "Clubs"
        }
    }
}

let hearts: Suit = .hearts
let heartsDescription = hearts.sampleDescription()
print("heartsDescription",heartsDescription)

if let convertBank = Rank(rawValue: "Welcome") { // Value as been changed
    print("Converted Rank:",convertBank.sampleDescription())
}


enum ServerResponse {
    case success(String, String)
    case failure(String)
}


let success = ServerResponse.success("Welcome to Apple Inc.", "https://www.apple.com")
let failureReason = ServerResponse.failure("Authentication failed")

switch failureReason {
    
case .success(let description, let URl):
    print("The \(description) at \(URl)")
    
case .failure(let error):
    print("Something went wrong \(error)")
}


struct Card {
    let rank : Rank
    let suit: Suit
    
    func sampleDescription() -> String {
        return "\(rank.sampleDescription()) of \(suit.sampleDescription())"
    }
    
    func combinationOfCard() -> [Card] {
        var cards: [Card] = []
        
        for suit in Suit.allCases {
               for rank in Rank.allCases {
                   cards.append(Card(rank: rank, suit: suit))
               }
           }
        return cards
    }
}


let card = Card(rank: .five, suit: .diamonds)
print("Card Description:", card.sampleDescription())
print("\n")
print("Total card details:", card.combinationOfCard())


// IteratorProtocol and Sequence
/*
// Custom iterator that counts from 1 to max
struct CounterIterator: IteratorProtocol {
    typealias Element = Int

    var current = 1
    let max: Int

    mutating func next() -> Int? {
        guard current <= max else { return nil }
        defer { current += 1 }
        return current
    }
}

// Sequence that uses the iterator
struct Counter: Sequence {
    typealias Element = Int  // ✅ explicitly specify Element
    let max: Int

    func makeIterator() -> CounterIterator {
        return CounterIterator(current: 1, max: max)
    }
}

// Use the sequence
let counter = Counter(max: 5)
for number in counter {
    print(number)
}
*/


///  Property
///

var userName: String {
    "Pavunraj"
}

print("userName Get property does not store value:", userName)
