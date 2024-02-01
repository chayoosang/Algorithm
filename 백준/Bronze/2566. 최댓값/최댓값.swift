var list: [[Int]] = []

for _ in 0..<9 {
    var input = readLine()!
    var split = input.split(separator: " ")
    var inputList:[Int] = []
    split.forEach {
        inputList.append(Int($0)!)
    }
    
    list.append(inputList)
}

var max = -1
var index = (-1,-1)

for i in 0..<9 {
    for j in 0..<9 {
        if list[i][j] > max {
            max = list[i][j]
            index = (i, j)
        }
    }
}

print(max)
print("\(index.0+1) \(index.1+1)")