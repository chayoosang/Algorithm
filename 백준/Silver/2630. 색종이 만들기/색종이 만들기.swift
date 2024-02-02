let n = Int(readLine()!)!
var list:[[Int]] = []
var result: [Int] = [0, 0]

for _ in 0..<n {
    let inputList = readLine()!.split(separator: " ").map({Int($0)!})
    list.append(inputList)
}

func check(_ x: Int, _ y: Int, _ width: Int) -> Bool {
    let color = list[x][y]
    for i in x..<x+width {
        for j in y..<y+width {
            if color != list[i][j] {
                return false
            }
        }
    }
    return true
}

func main(_ x: Int, _ y: Int, _ width: Int) {
    if check(x, y, width) {
        result[list[x][y]] += 1
    }else {
        main(x, y, width / 2)
        main(x + width / 2, y, width / 2)
        main(x, y + width / 2, width / 2)
        main(x + width / 2, y + width / 2, width / 2)
    }
}

main(0, 0, n)

result.forEach {
    print($0)
}
