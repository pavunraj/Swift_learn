import UIKit

// Map(_:)

/// convert into all element into string
///

let array1 = [1, 2, 3, 4, 5, 6, 7]

let stringArr = array1.map { String($0) }
//print(stringArr)


/// optional mapping
///

let name: String? = "Swift"

var upperCase = name.map {$0.uppercased()}

//print(upperCase!)



/// Dictionary mapping
///

var dic: [String: Int] = ["Apple": 100, "Orange": 200]

var returnkeys = dic.keys
var returnValues = dic.values
//print(returnkeys)
//print(returnValues)

var returnDic = dic.mapValues({ $0 + 2 })
print(returnDic)
let list = returnDic.map({ ($0.key, $0.value) }) // used tuples
//print("MyList",list)



let findNilArr = ["1", "2","Raj","5"]

var compactArr = findNilArr.compactMap({ Int($0)})
var StringArr = findNilArr.compactMap({ String($0)})
print(compactArr)
print(StringArr)


/// 2D array
///
var TwoDArr = [(1,2), (4,5), (7,8)]

//var modifyTwoDArr = TwoDArr.map { $0.1}
var modifyTwoDArr = TwoDArr.map { $0.1 + 5 }
//print("modifyTwoDArr",modifyTwoDArr)

var arrDic : [[String: Int]] = [["welcome":500],["to": 400]]
var modifiyVlaue = arrDic.map { $0.mapValues({$0 + 2})
}
//print("modifiyVlaue",modifiyVlaue)


/// Enumerated
///

var dataArr: Set = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolás"]
var shortedArr: Set<String> = []
for (index, value) in dataArr.enumerated() {
    if value.count <= 5 {
        shortedArr.insert(value)
    }
}
print(shortedArr)

/// Zip method


var dataArr1: Set = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolás"]
var dataArr2: Set = ["iOS", "macOS", "tvOS", "watchOS", "Linux"]

var zipData: Set<String> = []

for (index, value) in zip(dataArr1, dataArr2) {
    zipData.insert(value)
    zipData.insert(index)
}
var unionResult = dataArr.union(dataArr2)
//print("zipData",zipData)
//print("unionResult",unionResult)


/// Filter
///

var filterArr = [1,2, 3, 4, 5]

for i  in filterArr.filter({ $0 % 2 == 0}) {
    print(i)
}

let multiplesOfThree: [Int] =  filterArr.filter({ (item: Int) -> Bool in
    return item % 3 == 0
})

//print("multiplesOfThree",multiplesOfThree)
/// 2nd approach
///
let filterArr2 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let multipleOFThree  = filterArr2.filter({ (number: Int) -> Bool in
    return number.isMultiple(of: 3)
})

print("multipleOFThree",multipleOFThree)
