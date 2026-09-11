//: [Previous](@previous)

import Foundation

// Closure

class Student {
   func addFunction() {
        add(10, 20) { result in
           print(result)
       }
    }
}

func add(_ a: Int, _ b: Int, completionHandler: (_ result: Int) -> Void) {
    let sum = a + b
    completionHandler(sum)
}
let callStudent = Student()
callStudent.addFunction()

// Function add multiple arguments

func isValidName(input name: String...) {
    print(name)
}

isValidName(input:  "John", "Doe", "Smith") // Return array values

// Nested function

func operate(_ input: String) -> (Int,Int) -> Int {

    func add(a: Int, b: Int) -> Int {
        return a + b
    }

    func subtract(a: Int, b: Int) -> Int {
        return a - b
    }
    
    let operation = (input == "+") ? add : subtract
    return operation
}

let operation = operate("-")
let result = operation(10, 20)
print(result)

// Tuples
class Person {
    var product = ("MacBook Pro","$1,200")
    // Named tuples
    var items = (apple:"iPhone Device", price:200)
    // Nested tuples
    var productItem: (name: String, price: Int,Address: (street: String, city: String))
    // Add dictionary inside tuples
    var dictionaryTupels: (name: String, age: Int, address: [String: String])
    let person: (name: String, age: Int?)
    init(person: (name: String, age: Int?)) {
        self.person = person
        self.productItem = ("MacBook Pro", 1200, ("123 Main Street", "New York"))
        self.dictionaryTupels = ("John", 25, ["street": "123 Main Street", "city": "New York"])
        dictionaryTupels.2["USA"] = "11 AM"
    }
    

    func print() {
        dictionaryTupels.2["Salem"] = "Ariyannur"

        Swift.print(person.name)
        Swift.print(person.age!)
        Swift.print(product.0,product.self ,product.1)
        Swift.print(items.apple,items.price)
        Swift.print(productItem.name,productItem.price,productItem.Address.street,productItem.Address.city)
        Swift.print(dictionaryTupels.name,dictionaryTupels.age,dictionaryTupels.address["street"]!,dictionaryTupels.address["city"]!,dictionaryTupels.address["USA"])
    }
}

let details = (name: "John", age: 25)
let person = Person(person: details)
person.print()
