func reLine(_ input: inout [Int]) -> Int {
    var count = 0
    
    for i in 0..<input.count-1 {
        for j in i+1..<input.count {
            if input[i] > input[j] {
                let tmp = input[j]
                input[j] = input[i]
                input[i] = tmp
                count += 1
            }
        }
    }    
    
    return count
}

func solution() {
    let p = Int(readLine()!)!
    var count: [Int] = []
    
    for _ in 0..<p {
        var input = readLine()!.split(separator: " ").map{Int($0)!}
        input.removeFirst()
        
        count.append(reLine(&input))
    }
    
    for i in 0..<count.count {
        print("\(i+1) \(count[i])")
    }
}

solution()
