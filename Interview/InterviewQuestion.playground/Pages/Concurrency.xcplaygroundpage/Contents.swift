//: [Previous](@previous)

import Foundation

//: [Next](@next)


actor  BankAccount  {
    private(set) var balance: Int
    
    init(balance:Int) {
        self.balance = balance
    }
    
    func depositAmount(enterAmount: Int) async {
        balance += enterAmount
    }
    
    func withDrawAmount(enterAmount: Int) async throws {
        guard balance > enterAmount else {
            throw MyError.inSufficientBalance
        }
        balance -= enterAmount
    }
    
    enum MyError: Error {
        case inSufficientBalance
    }
}


func managingAccount() async {
    
    let userAccount = BankAccount(balance: 50)
    
    Task {
        do {
             await  userAccount.depositAmount(enterAmount: 100)
            print("Balance available in your account: \(await userAccount.balance)")
        }
    }
   
    Task {
        do {
            try await userAccount.withDrawAmount(enterAmount: 230)
            let balance = await userAccount.balance
            print("Withdrawal successful. Balance available in your account: \(balance)")
        } catch  {
            print("Error: Insufficient balance.")
        }
       
    }
}


Task {
    await managingAccount()
}


// Task Group Message

func privateMessage() async {
   var collectionString = [String]()
    
    let string =  await withTaskGroup(of: String.self, body: { group -> String in
        group.addTask(operation: {
            "Hello"
        })
        group.addTask(operation: {
            "Hello 1"
        })
        group.addTask(operation: {
            "Hello 2"
        })
        group.addTask(operation: {
            "Hello 3"
        })
        
        for await value in group {
            collectionString.append(value)
        }
        
        return collectionString.joined(separator: " ")
    })
    
    print("Total string:",collectionString)
}

Task {
    await privateMessage()
}


/// Practical swift concurrency book
///

func getFamilyName() -> String {
    print("What's your family name?")
    return readLine() ?? "--"
    
}

getFamilyName()

