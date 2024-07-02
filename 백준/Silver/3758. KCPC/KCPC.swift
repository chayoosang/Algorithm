let t = Int(readLine()!)!
var result: [Int] = []

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n, k, t, m) = (input[0], input[1], input[2], input[3])
    
    var score = [[Int]](repeating: [Int](repeating: 0, count: k), count: n)
    var time = [Int](repeating: 0, count: n)
    var count = [Int](repeating: 0, count: n)
    
    var sort = [(Int, Int, Int, Int)]()
    
    for k in 0..<m {
        let log = readLine()!.split(separator: " ").map{Int($0)!}
        
        score[log[0]-1][log[1]-1] = max(score[log[0]-1][log[1]-1], log[2])
        time[log[0]-1] = k
        count[log[0]-1] += 1
    }
    
    for i in 0..<n {
        sort.append((score[i].reduce(0, +), time[i], count[i], i+1))
    }
    
    sort.sort {
        if $0.0 == $1.0 {
            if $0.2 == $1.2 {
                return $0.1 < $1.1
            }
            return $0.2 < $1.2
        }
        return $0.0 > $1.0
    }
    
    
    for j in 0..<sort.count {
        if sort[j].3 == t {
            result.append(j+1)
            break
        }
    }
    
    
    
}

result.forEach { print($0) }
