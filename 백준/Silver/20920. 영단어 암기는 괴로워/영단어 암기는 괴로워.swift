let input = readLine()!.split(separator: " ").map{Int($0)!}

let (n, m) = (input[0], input[1])

var dic: [String: Int] = [:]

for _ in 0..<n {
    let word = readLine()!
    
    if let _ = dic[word] {
        dic[word]! += 1
    }else {
        dic[word] = 1
    }
}


dic = dic.filter({
    $0.key.count >= m
})

var sort = dic.sorted {
    if $0.value == $1.value {
        if $0.key.count == $1.key.count {
            return $0.key < $1.key
        }
        return $0.key.count > $1.key.count
    }
    return $0.value > $1.value
}.map {
    $0.key
}

sort.forEach {
    print($0)
}