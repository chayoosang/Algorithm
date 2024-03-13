func solution() {
    let input1 = readLine()!.split(separator: " ").map{Int($0)!}
    
    var arr1: [[Int]] = []
    
    for _ in 0..<input1[0] {
        arr1.append(readLine()!.split(separator: " ").map{Int($0)!})
    }
    
    let input2 = readLine()!.split(separator: " ").map{Int($0)!}
    
    var arr2: [[Int]] = []
    
    for _ in 0..<input2[0] {
        arr2.append(readLine()!.split(separator: " ").map{Int($0)!})
    }
    
    var result: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: input2[1]), count: input1[0])
    
    for n in 0..<input1[0] {
        for k in 0..<input2[1] {
            for m in 0..<input1[1] {
                result[n][k] += arr1[n][m] * arr2[m][k]
            }
        }
    }
    
    result.forEach {
        $0.forEach{ print($0, terminator: " ")}
        print()
    }
}

solution()