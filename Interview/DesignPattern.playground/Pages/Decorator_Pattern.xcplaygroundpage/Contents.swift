//: [Previous](@previous)

import Foundation

/*
 Pavunraj
 Linkedin - www.linkedin.com/in/pavunraj-experienced-ios-dev
 Email id - pavunrajtech@gmail.com
 WhatsApp - +91 9578634446
 
 
 // Decorator
 
 Adding the responsibilities to object dynamically  without modified class

 */


// Method 1 classic

final class UserDefaultsDecorator : UserDefaults {
    
    private var userDefaults =  UserDefaults.standard
    

    convenience init(userDefaults: UserDefaults) {
        self.init()
        self.userDefaults = userDefaults
    }
    
  
    
  
    
    func set(date: Date?, forKey key: String) {
        userDefaults.set(date, forKey: key)
    }

    func date1(forkey key: String) -> Date? {
       return userDefaults.value(forKey: key) as? Date
    }
}

let userDefaults = UserDefaultsDecorator()

userDefaults.set(42, forKey: "the answer")
print(userDefaults.string(forKey: "the answer") ?? "?")

userDefaults.set(date: Date(), forKey: "now")


 
//   Method 2 Using Extension


extension UserDefaults {
    
    
    func set(date: Date?, forkey key: String) {
        self.set(date: date, forkey: "Now")
    }
    
    func date(forkey key: String) -> Date? {
        return self.value(forKey: key) as? Date
    }
}


let userDefault = UserDefaults()
userDefault.set(date: Date(), forkey: "Now")
print(userDefault.date(forkey: "Now") ?? "?")
    
