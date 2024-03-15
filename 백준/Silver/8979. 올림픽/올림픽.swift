func solution() {
    let nk = readLine()!.split(separator: " ").map{Int($0)!}
    let n = nk.first!
    let k = nk.last!
    
    var country: [Int: Int] = [:]
    
    for _ in 0..<n {
        var input = readLine()!.split(separator: " ").map{Int($0)!}
        var count = 0
        let index = input.removeFirst()
        
        for i in 0..<input.count {
            count += input[i] * (3-i)
        }
        
        country[index] = count
    }
    
    let sort = country.sorted {
        $0.value > $1.value
    }
    
    var rank = 1
    country[sort.first!.key] = rank
    
    for j in 1..<sort.count {
        if sort[j-1].value == sort[j].value {
            country[sort[j-1].key] = rank
            country[sort[j].key] = rank
            rank += 2
        }else {
            country[sort[j].key] = rank
            rank += 1
        }
        
    }
    
    print(country[k]!)
}
solution()
