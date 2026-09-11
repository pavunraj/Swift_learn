
import Foundation
import UIKit

// MARK: - Find the maximum and minimum element

var studentList = [50, 24, 5, 7, 1, 58, 0]
var studentDictionary: [String: Int] = ["Pavun":1, "Pavun1":12, "Pavun2":13, "Pavun3":14, "Pavun4":15, "Pavun5":16,]

print(studentList.sorted(by: <))


var min = studentList[0]
print("Min:",min)
var max = studentList[0]
var key = 7
studentList.forEach { element in
    
    print(element)
//    if min > element {
//        
//        min[]
//    }
//    

}


for i in 0..<studentList.count {
    
    if min > studentList[i] {
        min =  studentList[i]
    }
    if max < studentList[i] {
        max =  studentList[i]
    }
    
}


print("min",min, max)


// another method


for (index,(key,value)) in studentDictionary.enumerated() {
    
    print(index,key,value)
}



// sorting by loop


for i in 0..<studentList.count {
    
    for j in 0..<studentList.count - i - 1 {
        if studentList[j] > studentList[j+1] {
            let temp = studentList[j]
            studentList[j] = studentList[j+1]
            studentList[j+1] = temp
            
        }
    }
}


print(studentList)

// array search


for i in 0..<studentList.count {
    
    if studentList[i] == key {
        print("Mactch key:",studentList[i])
    } 
}


// Algorithm course


// Simply tried
/*
func rotateRightOnce(A: [Int]) -> [Int] {
    print("Before rotate Value of A: ",A)
    let rotate =  Array(A.dropFirst()) + [A.first!]
    print("After rotate value of A:", rotate)
    return Array(A.dropFirst()) + [A.first!]
    
}
*/

func rotateRightOnce(A: [Int]) -> [Int] {
    var newArray = Array<Int>(repeating: 0, count: A.count)
    for i in 0..<A.count - 1 { // 0(n) linear contant
      newArray[i + 1] = A[i]
    }
    newArray[0] = A.last!
    print("NewArray:",newArray)
    return newArray
}

rotateRightOnce(A: [1,2,3,4,5])

// Try Guard statement
/*
func process(array: [Int]?) {
    guard let arr = array, arr.isEmpty else {
        print("Array is empty. Exiting.")
        return
    }

    print("Processing array: \(array)")
}


process(array: [])
*/


func solutionForRotateRightOnce(_ A: [Int], K: Int) -> [Int] {
    
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    var result = A
    
    for i in 1...K { // 0(n) linear time
        result = rotateRightOnce(A: result) // 0(n) linear time but actually it's like quadric algorithms
    }
    
    return result
}


print(solutionForRotateRightOnce([1,2,3,4,5], K: 2))


// string input - 044   88 5555 8361


var inputString = "044   88 5555 8361"

var removeSpace = inputString.replacingOccurrences(of: " ", with: "")
var removeDash = removeSpace.replacingOccurrences(of: "-", with: "")
//print("After remove space:", removeDash)


//var count = 0
var count = -2
var result = ""
for i in removeDash {
    //print("i:",i)
    result.append(i)
    if count % 3 == 0 {
        result.append("-")
    }
    count += 1
    //result.append(i)
    if result.last == "-"  {
        result = String(result.dropLast())
    }
}
print("After add dash:", result)



// Find the Two sum from Array

let inputItem = [2, 7, 12, 10, 5]
let taregt = 9

func twoSum(nums: [Int], target: Int) -> [Int] {
    var dict: [Int: Int] = [:]
    
    for (currentIndex, value) in nums.enumerated() {
        var differance = target - value
        
        if let lastIndex = dict[differance] {
            return [lastIndex, currentIndex]
        }
        
        dict[value] = currentIndex
        
    }
    return []
}


let findTwoSum = twoSum(nums: inputItem, target: taregt)
print(findTwoSum)


// Merge the two Arrays
var nums1 = [1, 2, 3, 0, 0, 0]
let nums2 = [2, 5, 6]


print(nums1)


// Reverse the input


func reverseInputItem<T>(_ a: [T]) -> [T] {
    var reverseChar = [T]()
    
    for i in a {
        reverseChar.insert(contentsOf: [i], at: 0)
    }
    return reverseChar
}


print(reverseInputItem([1,2,3,45,6,7,7,8, 9]))
print(reverseInputItem(["pavunraj","mani"]))
