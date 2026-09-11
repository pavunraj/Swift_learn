//: [Previous](@previous)

import Foundation


let gcd = DispatchQueue(label: "Hi")
//gcd.sync {
//    print("print 1")
//}
//
//gcd.sync {
//    print("print 2")
//}
//gcd.sync {
//    print("print 3")
//}
//
//gcd.sync {
//    print("print 4")
//}

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
