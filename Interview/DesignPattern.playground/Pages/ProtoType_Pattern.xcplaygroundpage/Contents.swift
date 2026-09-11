import UIKit

/*
 Pavunraj
 Linkedin - www.linkedin.com/in/pavunraj-experienced-ios-dev
 Email id - pavunrajtech@gmail.com
 WhatsApp - +91 9578634446

 
 // ProtoType
 
 the creation of new objects by copying an existing object, known as a prototype, rather than creating them from scratch.

 
 Benefits:
 1. Reduced Object Creation Overhead
 2. Flexibility
 3. Encapsulation
 
 
 Drawbacks:
 1. Complexity
 2. Deep Copy

*/

// How to clone or coping the rerefance type (prototype behaviour)
// make it class as a value type overhead of referance type


// MARK: - Example

class NameClass:NSCopying {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    
    func copy(with zone: NSZone? = nil) -> Any {
        return NameClass(firstName: self.firstName, lastName: self.lastName)
    }
    
    // optional clone
    
    func clone() -> NameClass {
        return self.copy() as! NameClass
    }
}

extension NameClass: CustomStringConvertible {
    public var description: String  {
        return "FistName \(firstName)- lastName \(lastName)"
    }
}


var name = NameClass(firstName: "Joe", lastName: "John")
var anotherName = name

print(name)
print("------")
print(anotherName)

//anotherName.firstName  =  "King"
//anotherName.lastName = "Kindom"

print("*************")
print(name)
print("------")
print(anotherName)   // it referance type pointing same memory address


print("---------------------------------------------")
// Change into value type
var name1 = NameClass(firstName: "Joe", lastName: "John")

// var anotherName1 = name.copy() as! NameClass  - optional 1

var anotherName1 = name1.clone()   // optional 2


print("Value type")
print(name1)
print("------")
print(anotherName1)

anotherName1.firstName  =  "King"
anotherName1.lastName = "Kindom"

print("*************")
print(name1)
print("------")
print(anotherName1)

