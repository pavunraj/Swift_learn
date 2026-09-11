//: [Previous](@previous)

import Foundation
import OSLog
import RegexBuilder

// MARK: - Find Duplicate character

let arr = [1, 2, 3, 4, 6, 6, 5, 2, 7, 8, 8]

let stringChar = "Pavunraj"
var stringChar1 = "Hello"
var stringChar2 = "rotator"
var stringChar3 = "abca"
var stringChar4 = "abac"

func findTheDuplicateArr<T: Hashable>(in input: [T]) -> [T] {
  var seen = Set<T>()
  var duplicateChar = Set<T>()
  input.forEach { char in
    if seen.contains(char) {
      duplicateChar.insert(char)
    } else {
      seen.insert(char)
    }
  }

  return Array(duplicateChar)
}

print("Duplicate Arr :", findTheDuplicateArr(in: Array(stringChar)))

// MARK: - String is Palindrome

func findPalindrome(in input: String) -> Bool {

  return String(input.reversed()) == input
}

print("Palindrome: ", findPalindrome(in: stringChar))

// Method 2

func findPalindome<T: StringProtocol>(in input: T) -> Bool {

  let char = input.lowercased().filter { $0.isLetter }

  return String(input.reversed()) == char

}

print("Method 2: ", findPalindome(in: stringChar2))

// MARK: - Do two strings contain the same characters

func findStringEqual(in input: String, out output: String) -> Bool {

  return input.sorted() == output.sorted()
}

/*
 let osLog = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "CheckPalindrome")

 os_log("%@ is a palindrome: %d", log: log, type: .info, stringChar1, findStringEqual(in: stringChar3, out: stringChar4))

 */

print("String equal: ", findStringEqual(in: stringChar3, out: stringChar4))

// sample 1

var studentList = ["Pavun", "PavunPalnisamy", "PavunMani", "PavunRaj", "PavunValue", "PavunRaj"]

print(studentList.count)
var count = Int()
var indutualCount = Int()
var totalCount = [String: Int]()
studentList.forEach { elements in

  for (index, value) in elements.enumerated() {
    count += 1
    indutualCount += 1
    totalCount[elements] = indutualCount
  }
  indutualCount = 0

}

print("Total count array strings: ", count, "\nIndutual words count: ", totalCount)

// Flat map - ignore the predicate value

// Flat map is decripted
var flatArr = ["1", "4", "welcome", "6", "Digit", "9"]

print("Flat Map", flatArr.compactMap({ Int($0) }))

// MARK: - Map
var mapArr = ["1", "4", "welcome", "6", "Digit", "9"]

print("Map Arr", mapArr.map({ $0 }))

// multiple

var intArr = [2, 4, 7, 7]

print("Mull", intArr.map({ $0 * 5 }))

var intArr1 = ["welcome", "Pavun", "raj", "sudo"]

print("uppercase", intArr1.map({ $0.uppercased() }))

print(
  "Incres Index",
  intArr1.enumerated().map({ index, word in
    "\(index + 1), \(word)"
  }))

// Regax concepts

// import Regax
let name = "Hello, Playground"

var pattern = Regex {
    OneOrMore(.word)
}

if let match = name.firstMatch(of: pattern) {
  print("Matching valule", match.output)
}



var isLoading = false


func getData() {
    
    if isLoading {
        print("Already data loaded")
        return
    }
    
    
    print("Now the data is loading")
    isLoading = true
    
    
}

getData()


// FIND DUPLICATE

func findDup<T: Hashable>(at input: [T]) -> [T] {
    var containsSet: Set<T> = []
    var duplicateSet: Set<T> = []
    input.forEach { i in
        if containsSet.contains(i) {
            duplicateSet.insert(i)
        } else {
            containsSet.insert(i)
        }
    }
    return Array(duplicateSet)
}

let assign = findDup(at: Array("pavunraj"))
print("assign",assign)
