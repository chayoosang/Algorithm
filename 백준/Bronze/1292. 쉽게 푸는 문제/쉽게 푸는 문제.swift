func solution() {
    var arr: [Int] = []
    var count = 0
    
    for i in 1..<1000 {
        for _ in 0..<i {
            if count == 1001 {break}
            arr.append(i)
            count += 1
        }
    }
    
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var sum = 0
    
    for i in input[0]...input[1] {
        sum += arr[i-1]
    }
    
    print(sum)
}
solution()
