//: [Previous](@previous)

import Foundation

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



