//: [Previous](@previous)

import Foundation
import SwiftUI
// Remove duplicate array

var nameList = ["pavun", "raj", "mani", "pavun", "palani"]

let convertToSet = Array(Set(nameList))
print("Remove the duplicate from array: \(convertToSet)")


// Brute force method
// solution 2

var newArray: [String] = []

for i in nameList {
    if !newArray.contains(i) {
        newArray.append(i)
    }
}

print("Brute force item is: \(newArray)")


// filter method used
// solution 3

let numbers = [1, 2, 3, 4, 4, 5, 5, 6, 8, 6]

let uniqueNumber = numbers.filter { number in
    numbers.firstIndex(of: number) == numbers.lastIndex(of: number)
}

print(uniqueNumber)



// The creating a queue by using array
// what is mean literals -> direct value is assign by varibales 



/// Only inhertaince for class not a struct
protocol DataPassDelegate: AnyObject {
    var name: String { get set }
    func passData(_ data: String)
}

//struct BankAccountAction: DataPassDelegate {
//    
//}

//// closure capture list
//


class NameList {
    var name = "Swift"
    // optional added for self will deinit will work
    lazy var printName: () -> Void = { [weak self] in
        print(self?.name)
    }
    deinit {
        print("Deinit")
    }
}

var obj: NameList? = NameList()
obj?.printName()
obj = nil



/// In out parameter
///

func increment(value: inout Int) {
    value += 5
}

var number = 10

increment(value: &number)
print("Update:",number)


/// swap function
///
func swapValue(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var a = 10, b = 20
swapValue(&a, &b)
print("a: \(a), b: \(b)")


/// advanced the operation inout paramter simultanliy access
///

var newValue = 10

func updateValue(_ a:inout Int, _ b: Int) {
    a += b
}

updateValue(&newValue, newValue)

print("New value: \(newValue)")


/// closure

var closureMethos = {
    print("Hi")
}

closureMethos()

var anotherClosureMethos: (()-> Void) = {
    
}



// reverse string

var myName = "Pavunraj"

print("Reverse string:",String(myName.reversed()))

/// withOut string

var reverseString: String = ""

myName.forEach { (char) in
    reverseString = String(char).lowercased() + reverseString
}

print("reverseString:",reverseString)


// palindrome

var isPalindrome = "Hello"

func findPalidrome(_ text: String) -> Bool {
    
    let lowerCaseText = text.lowercased()
    
    return lowerCaseText == String(lowerCaseText.reversed())
}

let status = findPalidrome(isPalindrome)
print("status:",status)

// 3. Count Character Occurrence


var dict:[Character: Int] = [:]

for char in myName {
    dict[char, default: 0] += 1
}

print("dictVlaue",dict)


// find largest array

var largestNumber = [1, 3, 5, 7, 11, 44, 66, 87, 67, 2, 99]

print("sortorder",largestNumber.sorted(by: <))
print(largestNumber.max())


// reverse the Int

var reverseInt = [Int]()

for intValue in largestNumber {
    reverseInt.insert(intValue, at: 0)
}

print("reverseInt",reverseInt)


// move all zero to end


var zeroValue = [1, 0, 5, 6, 0, 4]


var resultNonZero = zeroValue.filter { $0 != 0 }

print("resutlNon",resultNonZero)

while resultNonZero.count < zeroValue.count {
    resultNonZero.append(0)
}

print("resultNonZero",resultNonZero)

///----------------------------



/// closure

struct Student {
    var name: String
    var totalScore: Int
}
let greet: (_: Int, _: Int) -> Int = { (a: Int, b: Int) -> Int  in
    return 0
}


func determineHigherValue<T: Comparable>(_ a: T, _ b: T) -> T {
    let higherValue = a > b ? a: b
    print("Higher value is \(higherValue)")
    return higherValue
}


determineHigherValue(10, 8)
determineHigherValue("Pavunraj", "Raj")



let student = [Student(name: "Pavunraj", totalScore: 50),Student(name: "Mani", totalScore: 55),Student(name: "A1", totalScore: 10),Student(name: "A2", totalScore: 12),Student(name: "A3", totalScore: 35),Student(name: "A4", totalScore: 39)]
let n1 = student.filter { name in
    return name.totalScore > 49
}
let passStudent = student.filter {$0.totalScore > 34 }
    .map {$0.name }

print("List passStudent \(passStudent))")

@propertyWrapper
struct Trimmed {

    private var value: String

    init(wrappedValue: String) {
        self.value = wrappedValue.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
    }

    var wrappedValue: String {
        get { value }
        set {
            value = newValue.trimmingCharacters(
                in: .whitespacesAndNewlines
            )
        }
    }
}

struct User {
    @Trimmed var name = ""
}

var user = User()
user.name = "    pavun    raj        "

print(user.name)




struct A {
    var name: String
}

//let aValue = A(name: "Pavunraj")
//aValue.name = "Raj"

class AA {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let AValue = AA(name: "Pavunraj")
AValue.name = "Raj"


struct OperationQueue<Element> {
    private var queue: [Element] = []
    
    mutating func isEmptyw() -> Bool {
        queue.isEmpty
    }
    
    var isEmpty: Bool {
        queue.isEmpty
    }
    var Count: Int {
        queue.count
    }
    
    mutating func adding(_ element: Element) {
        queue.append(element)
    }
    
    mutating func dequeue() -> Element? {
       return queue.isEmpty ? nil : queue.removeFirst()
    }
}


var dictionayItem: [String: Int] = ["Apple": 5, "Banana": 6, "Carrot": 3, "Orange": 2]
var filterDic = dictionayItem.filter { $0.value > 3 }
print(filterDic.keys)


func reversedArray<T>(arr:[T]) -> [T] {
    var reverseArr: [T] = []
    for i in stride(from: arr.count - 1, through: 0, by: -1) {
        reverseArr.append(arr[i])
    }
    
    return reverseArr
}

var inPutArr1 = [1, 2, 3, 4, 5]
var inPutArr2 = ["Dette", "is", "a", "test"]
print(reversedArray(arr: inPutArr1))
print(reversedArray(arr: inPutArr2))



// trailing closure

func trailingClosure(_ a: Int, then: () -> (), finally: () -> Void) {
}

trailingClosure(10) {
    
} finally: {
    
}

func closure (completion: @escaping (Int) -> Void)  {
    completion(10)
}


func execute(completion: @escaping (Int) -> Void) {
    completion(10)
}

// completion can't use in store property

struct Names: Equatable {
    var firstName: String?
    var lastName: String?
}

func == (lhs:Names, rhs:Names) -> Bool {
    return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
}

var name: Names?
name?.firstName = "Pavunraj"
name?.lastName = "Karthik"

name?.firstName = nil
name?.lastName = "Karthik"

name?.firstName = "Pavunraj"
name?.lastName = "Karthik"


// optional chaining

class Persion {
    var name: String?
}

class Car {
    var car: Persion?
}

var car = Car()
car.car = Persion()
car.car?.name = "DD"
print("car",car.car?.name! ?? "")


// Mark: find the duplicate
 let interestingNumbers = [
"Prime": [2, 3, 5, 7, 11, 13],
"Fibonacci": [1, 1, 2, 3, 5, 8],
"Square": [1, 4, 9, 16, 25],
]
var LARGENUM: Int? = 0

for (_, numbers) in interestingNumbers {
    
    for number in numbers {
        
        if number > LARGENUM ?? 0 {
            LARGENUM = number
        }
    }
}
print(LARGENUM)

var largest = 0
for (_, numbers) in interestingNumbers.enumerated() {
    for number in numbers.value {
        if number > largest {
            largest = number
        }
    }
}
print(largest)


// where s

let vegetable = "red pepper"

func veg() {
    switch vegetable {
        
    case "sfsda":
        print("Non")
        
    case let x where x.hasSuffix("pepper"):
        print("This very spicy \(x)")
        
    default:
        print("default")
    }
    
}
print(veg()) // no print because of veg -> void
veg()


func studentID() async  -> Int {
    return 5
    
}

func teacher() async -> String {
    return "Hello"
}

func handlerSchool() async  {
    
    async let id = await studentID()
    async let teacher = await teacher()
    let greeting = await "\(id) \(teacher)"
    print("Hey! \(greeting)")
    
}

// only try is coming for on throw the function any details
Task {
    
     await handlerSchool()
}



struct NewNames {
    var name: String?
    // mutating only used on function
   // var name: String?
}
//let names2 = NewNames(name: "pavun")
var names = NewNames(name: "pavun")
// let names = NewNames(name: "pavun") can't assign the value because " let " marked and either add mutating keyword
//names2.name = "New names"
names.name = "New names"


// find  the unique numbers appears
let arrNames = ["Oa", "Pavun", "Ola", "Ather", "pavun", "pavun", "Bajaj", "bajaj"]


let filterNames = arrNames.filter { name in
    let normalString = name.lowercased()
   
    return arrNames.filter { $0.lowercased() == normalString }.count == 1
    
}

print("Matched filterNames:",filterNames)



protocol Addable {
    static func + (lhs: Self, rhs: Self) -> Self
}

extension Int: Addable {}
extension String: Addable {}

private func generics<T: Addable>(a:  T?, b:  T?) -> T?{
    guard let a = a, let b = b else { return nil }
    
    let result = a + b
    return result
}

print(generics(a: 12, b: 12) as Int? as Any)
print(generics(a: "welcome", b: "World") as Any)

let arrayWithDuplicates = [10, 20, 30, 30, 40, 50, 50]

let removeDuplicate = Array(Set(arrayWithDuplicates))
print(removeDuplicate)

// another method

var newArraywithRemoveDup: [Int] = []
arrayWithDuplicates.forEach { number in
    if !newArraywithRemoveDup.contains(number) {
        newArraywithRemoveDup.append(number)
    }
}

print(newArraywithRemoveDup)


// with Filter

let values = arrayWithDuplicates.filter({ num in
    print("number:", num)
    return arrayWithDuplicates.firstIndex(of: num) == arrayWithDuplicates.lastIndex(of: num)
    
})

print("Final num",values)


// Simple Json File create and Codable use

// Data and Mode protocol

// Codable
// Equatable
// Hashable
// Identiable
// Comparable
//

// Collection protocol
// Sequance
// Collection
// IteratorProtocol


struct UserDetails: Codable {
    let id: Int
    let name: String
    let email: String
}

let jsonData = """
[
{
"id": 1,
"name": "Pavun",
"email": "pavun@gmail.com"
},
{
"id": 2,
"name": "Pavun1",
"email": "pavun1@gmail.com"
},

{
"id": 3,
"name": "Pavun3",
"email": "pavun3@gmail.com"
}]
""" .data(using: .utf8)

let jsonDecode = try JSONDecoder().decode([UserDetails].self, from: jsonData!)
jsonDecode.forEach { details in
    print(details.email)

}
var wordFrequencies: [String: Int] = ["apple": 4,
"banana": 3, "cherry": 2, "date": 1]

var findMaximumVlaue: [String: Int] = [:]

for(word, frequency) in wordFrequencies {
    
    if frequency >= 3 {
        findMaximumVlaue[word] = frequency
    }
    
}

print(findMaximumVlaue)


var filterMaximumNumber = wordFrequencies.filter { $0.value >=  3 }

print(filterMaximumNumber)


// associatedTypes

protocol Container {
    associatedtype dictionayItem
    
    
    var item: dictionayItem { get set }
}

class APIService: Container {
    typealias dictionayItem = String
    var item: String
    
    init(item: String) {
        self.item = item
    }
}


protocol Repository {
    associatedtype model
    
    func fetchData() -> model
}


class UserRepository: Repository {
    
    func fetchData() -> String {
        return "pavun"
    }
}


// Associated Value
// An assocaiated values means enum is carry some additional values

 enum Error {
    
case invalidURL(String)
    case invalidData(Data)
    case invalidResponse(URLResponse)
    case decodeError(Int)
}


import Combine
import UIKit

class HomePageVC: UIViewController {
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var button: UIButton!
    
    private var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.publisher(for: \.text)
            .map {$0?.isEmpty == false }
            .assign(to: \.isEnabled, on: button)
            .store(in: &cancellables)
    }
}


let subject = PassthroughSubject<String,Never>()

var  cancellable = Set<AnyCancellable>()

subject
    .map { $0.uppercased()}
    .sink { value in
        print(value)
    }
    .store(in: &cancellable)


subject.send("Swift")
subject.send("Combine")


// 2D array with return sum value

var Array1: [[Int]] = [[1, 2, 3, 4, 5, 6], [7, 8, 9, 14, 15, 26]]
    
    var newElement = Array1.flatMap { $0 }.reduce(0, +)
   
//Array.reduce(0, +)
print(newElement)
    

// Fird the first match condition

let numbers1 = [1, 3, 4, 6]

let newNumber = numbers1.first{ $0 % 2 == 0}

print(newNumber)

let names1 = ["Pavun","Raj"]
let scores = [85, 92, 78]

for (name, score) in zip(names1, scores) {
    print("\(name): \(score)")
}


// Dependancy injection

protocol ProfileDetailsProtocol
{
    func fetchProfileInfo()
}


class APIServices: ProfileDetailsProtocol {
    func fetchProfileInfo() {
        print("Fetch user profile details from API")
    }

}

class UserProfileViewModel {
    private var services: ProfileDetailsProtocol
    
    init(services: ProfileDetailsProtocol) {
        self.services = services
    }
    
    func loadProfile() {
        services.fetchProfileInfo()
    }
}


let apiServices = APIServices()
let viewModel = UserProfileViewModel(services: apiServices)
viewModel.loadProfile()


var newArrayItem = ["Hello", "Pavunraj"] + ["How are you!"]
print(newArrayItem)


var numbers22 = [1, 2, 3, 4, 5, 6]
for number in numbers22 {
    if number.isMultiple(of: 2) {
        print(number)
    }
}

// Varadic function
func sum(of value: Int...) {
    print(value)
}

sum(of: 1,2,34,5)


func fetchData(then parse: (String) -> Void) {
    let data = "Success!"
    parse(data)
}

fetchData {  (data: String) in
    print("Data received: \(data)")
    
}

// filter the data
let numbers21 = [1, 2, 3, 4, 5, 6]

var result = numbers21.filter {
    $0.isMultiple(of: 2)
}

print(result)

func visitPlaces() -> (String) -> Void {
    var places: [String: Int] = [:]
    return {
        places[$0, default: 0]  += 1
        let numbervisit = places[$0, default: 0]
        print("The number of times \($0) the times \(numbervisit)")
    }
}
let place = visitPlaces()
place("Salem")
place("Chennai")
place("Salem")


struct GalacticaCrew {
    var isCylon = false
}
var starbuck = GalacticaCrew()
var tyrol = starbuck
tyrol.isCylon = true
print(starbuck.isCylon)
print(tyrol.isCylon)

class Statue {
    var sculptor = "Unknown"
}
var venusDeMilo = Statue()
venusDeMilo.sculptor = "Alexandros of Antioch"
var david = Statue()
david.sculptor = "Michaelangelo"
print(venusDeMilo.sculptor)
print(david.sculptor)

protocol Swimmable {
    var depth: String { get }
}
