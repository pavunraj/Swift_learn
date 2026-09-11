
import Foundation

// Empty Array


var emptyError: [String] = []
var emptyDictionary: [String:Any] = [:]


let individualScores = [75, 43, 103, 87, 12]

var totalScrore = 0


for score in individualScores {
    
    if score > 50 {
        totalScrore += 3
    } else { totalScrore += 1 }
}


print(totalScrore)


let scoreDecoration = if totalScrore > 10 {
    "Yes"
} else { "No" }

print("ScoreDecoation", scoreDecoration)



// Switch Statement


//let vegetable = "Red papper"
let vegetable = "waterClass"


switch vegetable {
    
    
case "celery":
    print("It some calery")
    
case "cucumber", "waterClass":
    print("Add some the cucumber , and or waterClass")
    
case let x where x.hasSuffix("papper"):
    print("It is add \(x)")
    
default:
    print("Nothing")
}


// Computed property

class Vegetables {
    
    var firstName = ""
    var lastName = ""
    var changeValue = ""
    
    init(firstName: String = "", lastName: String = "") {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        
        get {
            firstName + lastName
        }
        
        set(newvalue) {
           changeValue =  newvalue + lastName + firstName
        }
     }
    
}


var vegetable1 = Vegetables(firstName: "Hello",lastName: "Hi")

print(vegetable1.fullName)
vegetable1.fullName = "sds"
print(vegetable1.changeValue )


// calling the class method

// above calling method is default calling

// optional chaining


var person: Vegetables?

person?.fullName = "Raj"
person?.firstName =  "Thill"

var person1 = Vegetables(firstName: "Thillls")
person = person1
print(person?.firstName ?? "d")


// Array creation

var emptyArr:[Double] = []

// full declaration

var emptyArrDec:Array<Float> =  Array()


// you need an array that is preinitialized with a fixed number of default values


var fixedArr = Array(repeating: 1, count: 10)
print(fixedArr)


 for i in fixedArr {
   print(i)
}
