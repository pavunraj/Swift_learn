import UIKit
import Foundation

// Operators
// == -- Equlity
// ===  -- Identity

print("")
print("----  Equlity && Identity -----")
print("")
let x = 5
let y = 5

if x == y {
    print("Yes both are equable")
}


// Identity - only available for class instance

struct Person:Equatable {
    
    var name: String
    var city: String
    
}


let user = Person(name: "Pavun", city: "Salem")
let user1 = user


if user1 == user { // here is not applicable for identity
    print("Both user details same")
}



class Person1 : Equatable {
    
    var name: String
    var city: String
    
    init(name: String, city: String) {
        self.name =  name
        self.city = city
    }
    
    static func ==(lhp: Person1, rhp: Person1)-> Bool {
        return lhp.name == rhp.name && lhp.city == rhp.city
    }
}


var usr = Person1(name: "Pavun", city: "Salem")

var usr1 = usr

usr1.name = "Hi joe"
if usr === usr1 {  // checked identity operator
    print("Both user same ")
}

print("")
print("---------- Equable and Indentity is completed -------------")
print("")
print("---------- Logic array program ---------- ")
print("")
var inputArray = [2,1,8,9]
var target = 10

for (index1, item1) in inputArray.enumerated() {
    print("loop 1 - (\(index1) \(item1))")
    for (index2, item2) in inputArray.enumerated() {
        print("loop 2 - (\(index2) \(item2))")
        
        if index1 != index2 && item1 + item2 == target {
            print("(\(item1) \(item2))")
        }
    }
}
print("------ Array logic First approach is completed ------")
print("")
print("-----------  Second approch ----------")
print("")

var dict = [Int: Int]()
for ( _, itemq) in inputArray.enumerated() {
    let diff = target - itemq
    //print(diff)
    if let _ = dict[diff] {
        print("(\(itemq) \(diff))")
    }
    dict[itemq] =  itemq
}

print("Dictionary item",dict)
print("")
print("-------- Array logic Second approach is completed ------")
print("")
print("--------- Third approch -------")
print("")

var inputArray1 = [2,3,4,1,2,3,4,6,6,6,7,8,9,9,1,1,3,4,6,8,8]
var shorted = inputArray1.sorted()
var left  = 0
var right = shorted.count - 1
//print("*1",right, shorted.count)
//print("Sorting array list",shorted)
while (left < right) {
    if left != 0 && shorted[left] == shorted[left - 1] {
        left += 1
       // print("I left",left)
        continue
    }
    let total = shorted[left] + shorted[right]

    if total == target {
        print("(\(shorted[left]) \(shorted[right]))")
        left += 1
        right -= 1
    }
    else if total > target {
        right -= 1
    } else {
        left -= 1
    }
}
print("------- Completed third approach --------")

print("")
print("--------  Enum -----------")
print("")

enum ErrorHandling: Error {
    case invalidUser, invalidEmailAddress
}


func loginUser(name: String, emailAddress: String) throws {
    
    if name == "" {
        throw ErrorHandling.invalidUser
    } else {
        print("UserName",name)
    }
}

do {
    try loginUser(name: "", emailAddress: "")
} catch ErrorHandling.invalidUser {
    print("Catch the error")
}


print("")
print("------------- Completed Enum error handling -------------")
print("")

print("------------  Generics -----------")
print("")

// create a function is generics
func userDetails<T>(name: T) {  //
    print("name:",name)
}


userDetails(name: 10)
userDetails(name: "Welcome")
userDetails(name: "Welcome 2")
userDetails(name: 2338.000)
print("---------- Completed Generics function   --------------")

// create a generics  class


class newUserDetails<T> {
    
    var name: T
    
    init(name: T) {
        self.name = name
    }
    
    func getUser() -> T {
        print("User Name: ",name)
        return name
    }
}


let usr3 = newUserDetails(name: "Pavun")
usr3.getUser()

let usr2 = newUserDetails(name: 10)
usr2.getUser()

print("")
print("------------ Completed Generics class  --------------")
print("")

print("--------------  Optional protocol ----------------")
print("")

@objc protocol myOptionalProtocol : NSObjectProtocol {
    @objc optional func findUserDetails(name: String)
}


class findUserInfo : NSObject, myOptionalProtocol {
    
}
print("")
print("--------------- Completed Optional protocol  -----------------")
print("")

print("-------------  String Reverse ----------------")
print("")
let originalString = "Hello, World!"
var reverseOrder = ""
print(String(originalString.reversed()))

// without higherOrder function

originalString.forEach({ i in
    reverseOrder = String(i) + reverseOrder
})
print("ReverseOrder",reverseOrder)
print("")
print("-------------- Weak and Strong , Unwoned -----------------")

class Vechile {
    
    var car: Car?
    var name: String?
    
    init(car: Car?, name: String?) {
        self.car = car
        self.name =  name
        print("\(self) allocated")
    }
    
    deinit {
        print("\(self) deallocated")
    }
    
}

class Car {

    var model: String?
   // var vechile: Vechile?
   weak var vechile: Vechile?
    
    init(model: String?, vechile: Vechile?) {
        self.model = model
        self.vechile = vechile
        print("\(self) allocated")
    }
    
    deinit {
        print("\(self) deallocated")
    }
}

/// Not store any value
//Vechile.init(car: nil, name: "Benz")

/// Store the value into referance

var vechile:Vechile? = Vechile(car: nil, name: "Benz")
var car:Car? = Car(model: "V-90", vechile: nil)

// Need to strong referance for both
// need to create a weak referance of the object
vechile?.car =  car
car?.vechile = vechile

vechile =  nil
car = nil

print("")
print("-------------- Completed Weak and Strong , Unwoned -----------------")
print("")

print("")
print("-------------- Defer Statement -----------------")
print("")

func handleDefer() -> Int {
    
    defer {
        print("Stage 2")
    }
    
    print("Stage 1")
    return 0
}

handleDefer()

// write a complex defer

print("-------------------")
func complexDefer()  {
    print("Stage 1")
    defer {
        print("Stage 2")
    }
    defer {
        print("Stage 3")
        defer {
            print("Stage 7")
            defer{
                print("Stage 8")
            }
        }
    }
    
    defer {
        print("Stage 5")
    }
    defer {
        print("Stage 10")
        defer {
            print("Stage 9")
        }
        print("Stage 6")
    }
    
    print("Stage 4")
}

// Output - 1, 4, 10, 6, 9, 5, 3, 7, 8, 2

complexDefer()

print("")
print("-------------- Completed Defer Statement -----------------")
print("")

// Bubble sort
print("--------------  The array integer using bubble sort --------------")
print("")

var intArr = [2000, 10, 1, 15, 35, 11, 12, 18, 60, 5, 88, 6, 8, 12, 0]
//intArr.reverse()
//print(intArr)
var nonDuplicateArr = [Int]()

for i in 0..<intArr.count { 
   
    for j in 0..<intArr.count - 1 - i {
        if intArr[j] > intArr[j+1] { // ascending order
        //if intArr[j] < intArr[j+1] { // decending order
            let temp = intArr[j]
            intArr[j] = intArr[j+1]
            intArr[j+1] = temp
        }
    }

}

print("Ascending order: ",intArr)
print("Second largest Number: ",intArr[intArr.count - 2])

print("")
print("--------------  Remove the duplicate form array -------------- ")
print("")


intArr.forEach({ i in
    if !nonDuplicateArr.contains(i){
        nonDuplicateArr.append(i)
    }
})
print("Removed Duplicate arr:",nonDuplicateArr)

print("")
print("------ Using set method -----")
print("")
let uniqNum =  Array(Set(intArr))

print("Set method removed the uniqNum:",uniqNum)
print("")
print("--------------  Sort the string array  --------------")
print("")
var strArr = ["Welcome", "Home", "Joe", "I", "Am", "Sort", "String"]

let strS = strArr.sorted(by: >)
print("HigherOrder Function",strS)

print("")
print("------ User Default address -----")
print("")

let userDefault = UserDefaults.standard
var dictionary =  ["Hi":"Pavun", "Team":"Welcome"]
let _ = userDefault.set(["Hi", "Team"], forKey: "arrValue")
let _ = userDefault.set(3.0, forKey: "floatValue")
let _ = userDefault.set("Hi Value", forKey: "strValue")
let _ = userDefault.set(dictionary, forKey: "dictValue")

let v1 =  userDefault.array(forKey: "arrValue")
let v2 =  userDefault.float(forKey: "floatValue")
let v3 =  userDefault.string(forKey: "strValue")
let v4 =  userDefault.dictionary(forKey: "dictValue")
print(v1,v2,v3,v4)

print("")
print("------ User Default address completed -----")
print("")

print("") 
print("------ Computated Properties -----")
print("")

var pizzaSize : Int = 12
var numberOfPeople : Int = 6
var slicesofPizzaPeople : Int = 4

var numberofSlices: Int  {
    return pizzaSize - 4
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPizza = numberofSlices / slicesofPizzaPeople
        return numberOfPeople / numberOfPeopleFedPizza
    }
    set {
        let numberPeople = numberofSlices * newValue
        numberOfPeople = numberPeople / slicesofPizzaPeople
    }
}
print(numberofSlices)
print(numberOfPizza)
print(numberOfPeople)

print("")
print("Problem One is completed")
print("")
print("Problem 2")
print("")
var width: Float = 1.5
var height: Float =  2.5

var bucketOfPaint : Int {
    var area = width * height
    let areaofCovertWall : Float = 1.5
    print(area)
    var numberofBucker = area / areaofCovertWall
    return Int(numberofBucker)
}

print(bucketOfPaint)
print("")
print("------------GCD - (Serial and concurrent queue ) ---------------")
print("")

let serialQueue = DispatchQueue(label: "serial")
let concurrentQueue = DispatchQueue(label: "Concurrent",attributes: .concurrent)

type(of: serialQueue)
type(of: concurrentQueue)

serialQueue.async {
    for i in 1..<5 {
     //   print(i)
    }
}

concurrentQueue.async {
    for i in 5...10 {
     //   print(i)
    }
}


print("")
print("------------GCD - (Custom Queuses ) ---------------")
print("")
print("Types serial and concurrent")


let inActiveQueue = DispatchQueue(label: "concurrent",attributes: [.initiallyInactive,.concurrent])

inActiveQueue.async {
    print("Done")
}

print("Not to be stared")
inActiveQueue.activate()
print("Operation is done")

print("")
print("------------ SWIFTUI Class ---------------")
print("")
var array = [1,2,3,4,5,10,42,31,97,314]
var output = array.first(where: {$0 > 5}) ?? 0
print("5 after",output)

var array1 = [1,2,3,4,5,10,42,31,97,314]


for i in 0..<array1.count {
    for j in 0..<array1.count - i  - 1{
        if array1[j] > array1[j + 1] {
            let temp = array1[j]
            array1[j] = array1[j + 1]
            array1[j + 1] =  temp
            
        }
    }
}

print(array1)

var f =  array1.first(where: {$0 > 10}) ?? 0
print("After 10",f)


//GCD
print(" ")
print("MultiThread")
print(" ")

print("Called",Thread.threadPriority())


// 1. Automatically calling thread
class ThreadTest {
    
    func createThread() {
        Thread.detachNewThreadSelector(#selector(print), toTarget: self, with: nil)
    }
    
    @objc func print() {
        Swift.print("Thread loop")
    }
}

let call = ThreadTest()
call.createThread()


// 2. Thread is start manually


class ThreadTest2 {
    var thread = Thread()
    func createThread() {
        thread = Thread(target:self , selector: #selector(print), object: nil)
        thread.start()
       // thread.cancel()

    }
    
    @objc func print() {
        
        Swift.print("Thread loop 2")
    }
    
}
let call2 = ThreadTest2()
call2.createThread()


// Work Itmes

let items1 = DispatchWorkItem {
    for i in 0...5 {
        print("Items \(i)")
    }
  
}

DispatchQueue.global().async {
    items1.perform()
}
DispatchQueue.main.async {
    items1.perform()
}
items1.cancel()
//items1.perform()


// Dispatch Barrier

let dispatchBarrier = DispatchQueue(label: "barrier",attributes: .concurrent)


for i in 0...5 {
    dispatchBarrier.async {
        print("Stage 1 \(i)")
    }
}

for i in 6...15 {
    dispatchBarrier.async(flags: .barrier, execute: {
        print("Stage 2 \(i)")

    })
}

for i in 16...20 {
    dispatchBarrier.sync(flags: .barrier, execute: {
        print("Stage 3 \(i)")

    })
}


for i in 6...15 {
    dispatchBarrier.async(){
        print("Stage 4 \(i)")

    }
}


// Self vs self


print("")
print("------------ Self vs self ---------------")
print("")


struct Student {
    static var address: String?
    var name: String
    
    init(name: String) {
        self.name = name
        // self.name = name
    }
    
    func isValidName() {
        //print(name.isValidString(),Student.address)
        print(name.isValidString(),Self.address)
    }
    

}

var student1: Student? = Student(name: "Pavunraj")
student1?.isValidName()
student1 =  nil


extension String {
    
    func isValidString() -> Bool {
        return self.count > 3
    }
}

// With closure

class Amazon: UIViewController {
    var date: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delivery { [weak self] in
            self?.handler()
        }
    }
    func delivery(complitionHandler:@escaping() ->()) {
        complitionHandler()
    }
    
    func handler() {
        
    }
}

let accessPro = Amazon()
accessPro.delivery {
    accessPro.handler()
}

print("")
print("---Completed self vs Self")
print("")

// class vs static

print("")
print("------------ class vs static ---------------")
print("")


class Driver {
    static var route = "Erode"
    
    // class var anotherRoute =  "Salem"  // can;t use stored properties
    
    // we can use computated properties
    
    class var anotherRoute: String {
        return "Salem"
    }
    
    func changeRoute() {
        
    }
    
    static func sameRoute() {
        
    }
    
    // can't create a class function
}

class NewBusDriver: Driver {
    
    override func changeRoute() { // able to override normal function
        <#code#>
    }
    
    // can't override the static function
    
}

print("")
print("------------ Completed class vs static ---------------")
print("")

// Lazy property
print("")
print("------------ Lazy property ---------------")
print("")

class Totata {
    
    // lazy property can't use the let keyword
    // lazy property one use the stored property and can/t use computed property
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    lazy var modelName: String = {
        return firstName + lastName
    }()
    
    
    var newModelName: String {
        return firstName + lastName
    }
}

let carModel = Totata(firstName: "innova", lastName: "4+")

print(carModel.modelName)
print(carModel.newModelName)

print("***********")
carModel.firstName = "Fortunure"
print(carModel.modelName)
print(carModel.newModelName)

print("")
print("------------ Completed Lazy property ---------------")
print("")

// Higher order function
print("")
print("------------ Higher order function ---------------")
print("")

var numbers = [0, 3, 2, 7, 8, 9, 8, 6]
let result = numbers.sorted()
//print(result)
print("-----------------------------")
print("")

let result2 = numbers.sorted { a, b -> Bool in
    print("a",a)
    print("b",b)
    print("-----------------------")
    return a > b
}
print("Result2",result2)
print("")
// Map

let mapResult = numbers.map({String($0)})
let mapResult1 = numbers.map({($0 * 2)})
print(mapResult, "", mapResult1)


struct PersionPavun {
    
    var name: String?
    var isGotOffer:String?
    var place:String?
    var emailID:String?
    
    
}
var persionPavun =  [PersionPavun(name: "pavun",place: "Salem", emailID: "testpavun@gmail"),
                     PersionPavun(name: "pavun1",place: "Salem", emailID: "testpavun1@gmail"),
                     PersionPavun(name: "pavun1",place: "Salem", emailID: "testpavun134@gmail"),
                     PersionPavun(name: "pavun2",place: "Salem", emailID: "testpavun2@gmail"),
                     PersionPavun(name: "pavun3",place: "Salem", emailID: nil)]

let result3 = persionPavun.map {$0.name }
let emailResult = persionPavun.map {$0.emailID }
let emailResultNIL = persionPavun.compactMap {$0.emailID }
print(result3)
print(emailResult)
print(emailResultNIL)

print("")

let filterResult = persionPavun.filter { $0.name == "pavun1" }.map({$0.emailID})
print(filterResult)

// Reduce

let reduceFunction = numbers.reduce("") { $0 + String($1)}
print(reduceFunction)


//  closures

func performValue(on a:Int, and b:Int, operation:(Int, Int)->(Int)) -> Int {
    
    return operation(a, b)
}

let addOperation: (Int, Int) -> Int = {$0 + $1}
let value = performValue(on: 5, and: 3, operation: addOperation)

print("Add value",value)



// closure filter array


var clrArray = [ 1, 40, 60, 20, 100, 5, 1001, 22, 55, 24, 26, 88]

let sort = clrArray.sorted(by: >)
let fileterClr = clrArray.filter({$0 >= 60})
print(sort)
print(fileterClr)


// clr filter

var clrfilter = clrArray.filter({ number in
    
    return number % 2 == 0
    
})

print("Elements",clrfilter)


// struct closure

struct CrPerson {
    var name: String
    var age: Int
}


var peopleList = [CrPerson(name: "pavun", age: 12),CrPerson(name: "Raj", age: 44)]

let srt = peopleList.sorted(by: { p1, p2 in
    return p1.age < p2.age
})

print("Value",srt)



//  store properties closure


func makeIncrement(increment:Int) -> () -> Int {
    
    var total = 0
    
    let incrementer:() -> Int = {
        total += increment
        return total
    }
    return incrementer
    
}


let incrementValue = makeIncrement(increment: 2)
print("Yes",incrementValue)


// Protocol

protocol Definition {
    
    var name: String {get}
    
    func assignName(name:String)
}


// Protocol


// closure

var messages = {
    print("Hi")
}

var newMessage = { (name:String) in
    print(name)
}

messages()

newMessage("asdf")


var a = Amazon()
var b = a




func address(_ object:UnsafeRawPointer) -> String  {
    let  address = Int(bitPattern: object)
    return NSString(format: "%p", address) as String
}
 

print(address(&a))
print(address(&b))


var reduceArr  = [ 1, 5, 7, 8, 10]

let reOutput = reduceArr.reduce("") { $0 + String($1) }
print(reOutput)

// check string is palindrome


var pStr = "radar"

var pStr2 = "radar@%&*(&!QQDRF1234"

var reverseStr2 = pStr2.lowercased().filter { $0.isLetter || $0.isNumber}

var reverseStr = String(pStr.reversed())

print(reverseStr2)

if pStr == reverseStr {
    print("Its is palindrome")
} else {
    print("Not ")
}


if pStr2 == reverseStr2 {
    print("Its is palindrome pStr2")
} else {
    print("Not ")
}


protocol AProtocol {
    func findSumA()
}

protocol BProtocol {
    func findSumB()
}

protocol CProtocol {
    func findSumC()
}

final class A: AProtocol {
     var b: BProtocol?
     var c: CProtocol?
    
    func findSumA() {
        print("A")
        b?.findSumB()
        c?.findSumC()
    }
}

final class B: BProtocol {
     var a: AProtocol?
    var c: CProtocol
    
    init(c: CProtocol) {
        self.c = c
    }
    
    func findSumB() {
        print("B")
        a?.findSumA()
        c.findSumC()
    }
}

final class C: CProtocol {
    var a: AProtocol
    var b: BProtocol
    
    init(a: AProtocol, b: BProtocol) {
        self.a = a
        self.b = b
    }
    
    func findSumC() {
        print("C")
        a.findSumA()
        b.findSumB()
    }
}

let valueA = A()
valueA.findSumA()
