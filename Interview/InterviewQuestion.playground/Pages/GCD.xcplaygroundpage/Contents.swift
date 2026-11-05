//: [Previous](@previous)

import Foundation


let gcd = DispatchQueue(label: "Hi")
gcd.sync {
    print("print 1")
}

gcd.sync {
    print("print 2")
}
gcd.sync {
    print("print 3")
}

gcd.sync {
    print("print 4")
}

//gcd

let queue = DispatchQueue(label: "Concurrent", attributes: .concurrent)

//print("--------------------------")

queue.async {
    print("print 1")
}

queue.async {
    sleep(2)
    print("print 2")
}

queue.async {
    print("print 3")
}


queue.async {
    print("print 4")
}

queue.async {
    print("print 5")
}

queue

DispatchQueue.global().async {
    print("Background task")
}

print("Statement execute")


DispatchQueue.global().sync {
    print("Execute background task")
}
print("Next statement")


/// Operation (NSOperation)
///

final class MyOperation: Operation {
    override func main() {
        print("Execute operation")
        
        if isCancelled {
            return
        }
        // background task execute
    }
}

let queue1 = OperationQueue()
queue1.maxConcurrentOperationCount = 4
let image1 = MyOperation()
let image2 = MyOperation()
let image3 = MyOperation()
let image4 = MyOperation()
let image5 = MyOperation()

queue1.addOperations([image1, image2, image3, image4, image5], waitUntilFinished: false)

