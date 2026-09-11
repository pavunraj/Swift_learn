import UIKit

//MARK: Constant time O(n)
// Fast run and compile
func constantTime(_ n: Int) -> Int {
    n * n
}


//MARK: Linear time
// Worst case performance

func linearTime(_ n: [Int]) -> Int {
    
    for i in 0..<n.count {
        
        if n[i] == 0 {
            print("Found the line")
            return 0
        }
        else {
            print("i:",i)
        }
    }
    return 1

}

//linearTime([1,2,3,4,5,6,7,0,10])

// MARK: - logarithmic Time O(long n)

func logarithmicTime(_ N: Int) -> Int {
    
    var n = N
    var result = 0
    
    while n > 1 {
        n /= 2
        print("n value:",n)
        result += 1
        
    }
    print("I return result:",result)
    return result
}

//logarithmicTime(128)


// MARK: - Quadratic time 0(n^2)

func quadraticTime(_ n: Int) -> Int  {
    var result = 0
    
    for i in 0..<n {
        for j in i..<n {
            result += 1
            print("i:\(i) -> j:\(j)")
        }
    }
    return result
}

//quadraticTime(16)

var  list = [1, 2, 3, 4, 5]
list.append(6)


// Find common item from two array
// less space 0(n) and 0(n^2) more time

func commonArrayItem(_ A: [Int], _ B: [Int]) -> Bool {
    
    for i in 0..<A.count {
        for j in 0..<B.count {
            if A[i] == B[j] {
                print("common item:",A[i])
                return true
            }
        }
    }
    return false
}

//
//commonArrayItem([1,2,3], [3,5,6])

// Hash type find the common item from two array
// less time and more space (means create new data type)


func commonArrayFromHash(_ A: [Int], _ B: [Int]) -> Bool {
    
    var hash = [Int: Bool]()
 
    for a in A {
        print("a:",a)
        hash[a] = true
        
    }
    print("hash:",hash)
    
    for b in B {
        print("b:", b)
      
        if hash[b] == true {
            print("#hashValue:",b)
            return true
        }
    }
    return false
}

commonArrayFromHash([1,2,3], [3,5,6])

// How the array insert work?
// Before insert the item copy up item and space the it was insert
// Delete item is work as liner item because of need to move all item 0(n)
// Insert the array item also its has a 0(n)


// Linked List

class Node {
    var data: Int
    var next: Node?
    
    init(data: Int, node: Node? = nil) {
        self.data = data
        self.next = node
    }
    
}

let node3 = Node(data: 3)
let node2 = Node(data: 2, node: node3)
let node1 = Node(data: 1, node: node2)


func listofNode(_ head: Node?) {
    //if head == nil { return}
    guard let head = head else {
        return
    }
    var node = head
    
    while node.next != nil {
        print("Previous node:",node.next)
        node = node.next!
        print("Next node data:",node.next)
    }
    
}

listofNode(node1)
