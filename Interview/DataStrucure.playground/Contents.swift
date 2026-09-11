import UIKit

//MARK: - Even or odd

print("Find Even or odd")
print("  ")

let a = 11

if (a % 2 == 0) {
    print("Even")
} else {
    print("Odd")
}

print("Completed the Even or odd")
print("-----------------")

print("Find Last Digit Of a^b for Large Numbers")
print("   ")

func getlastDigit(with a:Int, with b:Int)-> Int {
     
    var c = String()
    for i in 1...10 {
       c = String(a * a)
        if i == 2 {
            c = String(Int(c)! * a)
        }
    }
    print(c.last)
    return Int(c)!
}

getlastDigit(with: 2, with: 10)

print("------------------------")
print("  ")
print("Second Method  the Even or odd")
print("  ")


func getLastD(base a:Int, index b:Int) -> Int {
    
    
    if b == 0 {
        return 0
    }
    
    var result = 1
    var baseValue = a % 10
    print("*",baseValue)
    
    for _ in 0..<b {
        result = (result * baseValue) % 10
    }
    print("R",result)
    return result
}

getLastD(base: 3, index: 10)

// 1. Implement a function to check if a given string is a palindrome.


func isPalindrome(with inputStr:String) -> Bool {
   var reverse = inputStr.reversed()
    return inputStr == String(reverse)
}

let isPalind = isPalindrome(with: "levell")
print(isPalind)
print(":")

// 2. Factorial

func factorial(with input:Int) -> Int {
    
    if input == 0 {
        return 1
    }
    return input * factorial(with: input - 1)
}

let outputFactorial = factorial(with: 5)
print(outputFactorial)

// 3.fibonacci

func fibonacci(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    var fib = 0
    var fib1 = 0
    var fib2 = 1
    
    for _ in 2...n {
        fib = fib1 + fib2
        fib1 = fib2
        fib2 = fib
    }
    return fib
}

let output = fibonacci(5)
print("output:",output)


// Leetcode

// 1. Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

var inputArr = [2,7,11,15]
var target = 9
func findTwoSum(with input1:[Int], with target1:Int) -> [Int] {
    
    var dict = [Int:Int]()
    for (index, num) in input1.enumerated() {
        let complement = target1 - num
        print("index: \(index)" , "num: \(num)", "complement: \(complement)")
        if let completedIndex = dict[complement] {
            
            return [completedIndex, index]
        }
        
        dict[num] = index
        
        print("Adrr",dict)
        //return [1,2]
    }
    fatalError("adsf")
    
}


let result = findTwoSum(with: inputArr, with: target)
print(result)
