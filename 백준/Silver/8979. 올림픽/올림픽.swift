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
    
    
    country[sort[0].key] = 1
    var rank = 2
    for j in 1..<sort.count {
        if sort[j].value == sort[j-1].value {
            country[sort[j].key] = country[sort[j-1].key]
        }else {
            country[sort[j].key] = rank
        }
        rank += 1
    }

    print(country[k]!)
}
solution()
