let n = Int(readLine()!)!

var first = readLine()!.map{String($0)}

var result = 0


for _ in 1..<n {
    var tmp = first
    
    let input = readLine()!.map{String($0)}
    var count = 0
    
    for a in input {
        if tmp.contains(a) {
            let index = tmp.firstIndex(of: a)
            tmp.remove(at: index!)
        }else {
            count += 1
        }
    }
    
    if tmp.count < 2 && count < 2 {
        result += 1
    }
}

print(result)