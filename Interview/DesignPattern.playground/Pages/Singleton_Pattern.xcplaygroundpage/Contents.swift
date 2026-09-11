/*
 Pavunraj
 Linkedin - www.linkedin.com/in/pavunraj-experienced-ios-dev
 Email id - pavunrajtech@gmail.com
 WhatsApp - +91 9578634446

 
 // Singleton
 
 The singleton pattern ensures that only one object of a particular class is ever created.
 
 
 Benefits:
 1. Global access
 2. Lazy initalization
 3. Thread safety
 4. memeory management
 
 
 Drawbacks:
 1. Global state
 2. Dependency injection
 3. overuse
 4. Potential for Memory Leaks
*/

import Foundation

//MARK: - Example

final public class Student {
    
    public static let shared = Student()
    private var conCurrentQueue = DispatchQueue(label: "conCurrentQueue",attributes: .concurrent)
    private var studentDetails:[String:Any] = ["name": "Raj", "age":22]
    
    private init() {
        // Private initialization to ensure just one instance is created.

    }
    
    public func string(forkey key: String) -> String? {
        
        conCurrentQueue.sync(flags: .barrier) {
            return studentDetails[key] as? String

        }
    }
    public func int(forkey key: String) -> Int? {
        conCurrentQueue.sync(flags: .barrier) {
            return studentDetails[key] as? Int

        }
    }
    
    public func set(forkey key:String,forvalue value:Any) {
        conCurrentQueue.async (flags:.barrier ){
            self.studentDetails[key] = value

        }
    }
    
    public func printDic() {
        print("All Details",studentDetails)
    }
}


/*
 
 # Usages
*/


let intance = Student.shared
intance.set(forkey: "Place", forvalue: "India")
let value = intance.int(forkey: "age")
let place = intance.string(forkey: "Place")
intance.printDic()
print(value,place)
