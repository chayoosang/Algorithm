func solution() {
    let input = readLine()!.map{String($0).uppercased()}
    var count: [String: Int] = [:]
    
    input.forEach {
        if let _ = count[$0] {
            count[$0]! += 1
        }else {
            count[$0] = 1
        }
    }
    let sort = count.sorted {
        $0.value > $1.value
    }
    
    if sort.count == 1 {
        print(sort.first!.key)
        return
    }
    
    if sort.first?.value == sort[1].value {
        print("?")
    }else {
        print(sort.first!.key)
    }
}
solution()
