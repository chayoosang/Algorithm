let input1 = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input1[0], input1[1])
var dic: [(Int, String)] = []

for _ in 0..<n {
    let input2 = readLine()!.split(separator: " ").map{String($0)}
    dic.append((Int(input2[1])!, input2[0]))
}

var sort = dic.sorted {
    $0.0 < $1.0
}

for _ in 0..<m{
    let num = Int(readLine()!)!
    
    var start = 0
    var end = dic.count - 1
    
    
    while start <= end {
        let mid = (start + end) / 2
        if num > sort[mid].0 {
            start = mid + 1
        }else {
            end = mid - 1
        }
    }
    
    print(sort[start].1)
}
