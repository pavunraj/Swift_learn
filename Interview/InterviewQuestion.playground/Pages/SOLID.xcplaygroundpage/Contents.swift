//: [Previous](@previous)

import Foundation
import XCTest

var greeting = "Hello, playground"

//: [Next](@next)

/// SOLID
//Single resposibility principle
//A class should have only one reason to change
// exmaple
class AuthServices {
    func loginRequest(name: String, email: String) {}
}

class UserDataStore {
    func saveUserData() {}
}

class EmailSentService {
    func sendEmail() {}
}

/// Real example

class LoginViewMolde {
    var authServices: AuthServices
    var userDataStore: UserDataStore
    var emailSentService: EmailSentService
    
    init(authServices: AuthServices, userDataStore: UserDataStore, emailSentService: EmailSentService) {
        self.authServices = authServices
        self.userDataStore = userDataStore
        self.emailSentService = emailSentService
    }
    
    func login(name: String, email: String) {
        authServices.loginRequest(name: name, email: email)
        userDataStore.saveUserData()
        emailSentService.sendEmail()
    }
   
}

/// --------------------------
// Open and Closed principle
// should be open for extension but closed for modification
//You should be able to add new functionality without changing existing code.
//Use protocols, inheritance, or composition to extend behavior.

// example

protocol NotificationSender {
    func send(message: String)
}


class EmailNotificationSender: NotificationSender {
    func send(message: String) {
        
    }
}

class PushNotificationSender: NotificationSender {
    func send(message: String) {
            
    }
}

class MobileAppNotificationSender: NotificationSender {
    func send(message: String) {
        
    }
}

let emailSender = EmailNotificationSender()
emailSender.send(message: "Hello")


///------------------------------

// Liskov substitution principle
// Objects of the subclass should be replace objects of superclass without breaking the application

protocol APIServices {
    func fetchUser()
}


class NetworkAPIServices: APIServices {
    func fetchUser() {
        debugPrint("load  the data")
    }

}

class UserViewMoldel {
    let services: APIServices
    
    init(services: APIServices) {
        self.services = services
    }
    
    func loadUser() {
        services.fetchUser()
    }
    
}


// Interface segregation  principle
// Clients should not be forced to depend on methods they do not use.
// use can use optional protocal also


protocol AuthenticationServies {
    func login()
    func logout()
}

@objc protocol ProfileServies {
   @objc optional func getUserProfile()
    func updateUserProfile()
}


protocol OrderServices {
    func placeOrder()
    func getOrderHistory()
}

class ProfileViewMoldel: NSObject {
    var profileServices : ProfileServies
    
    init(profileServices: ProfileServies) {
        self.profileServices = profileServices
    }
    func getUserProfile() {
        (profileServices.getUserProfile ?? <#default value#>)()
    }
    
    func updateUserProfile() {
        profileServices.updateUserProfile()
        
    }
    
    
}

/// --------------------


// Dependency inversion principle
// Higher level models should not depand on low level model, both should depand on abraction

// Easy Real-Life Analogy
// The phone depends on a USB-C standard (abstraction), not a specific charger.

// example

protocol UserService {
    func fetchUser()
}


class APIServicesUser: UserService {
    func fetchUser() {
        debugPrint("load  the data")
    }
}


/// Mock testing

class MockAPIServicesUser: UserService {
    func fetchUser() {
        debugPrint("Mock data")
    }
}

class UserDataViewMoldel {
    private var userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func loadTheUserData() {
        userService.fetchUser()
    }
}


let vm = UserDataViewMoldel(userService: APIServicesUser())
vm.loadTheUserData()


class UserViewModel {
    func validateInputText(email:String, password: String) -> Bool {
        email.contains("@") && password.count >= 8
    }
}


func testValidateUserInput() {
    var vm = UserViewModel()
    
    func testValue() {
     let result =   vm.validateInputText(email: "pavin@", password: "234567ewtrqre")
        print(result)
    }
    
    testValue()
}

testValidateUserInput()
