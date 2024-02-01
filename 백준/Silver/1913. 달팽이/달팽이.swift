var n = Int(readLine()!)!
var findNum = Int(readLine()!)!

var list: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

var xList = [1, 0, -1, 0]
var yList = [0, 1, 0, -1]

var listIdx = (0, 0)
var add = 0
var findIdx = (-1, -1)

for i in stride(from: n*n, to: 0, by: -1) {
    if list[listIdx.0][listIdx.1] == 0 {
        if findNum == i {
            findIdx = listIdx
        }
        list[listIdx.0][listIdx.1] = i
    }
    
    if list.count <= listIdx.0 + xList[add] || list[listIdx.0].count <= listIdx.1 + yList[add] || 
        0 > listIdx.0 + xList[add] || 0 > listIdx.1 + yList[add] || list[listIdx.0 + xList[add]][listIdx.1 + yList[add]] != 0 {
        add = (add + 1) % 4
    }
    
    listIdx = (listIdx.0 + xList[add], listIdx.1 + yList[add])
}

list.forEach { array in
    print(array.map({
        String($0)
    }).joined(separator: " "))
}

print("\(findIdx.0+1) \(findIdx.1+1)")
