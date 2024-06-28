let n = Int(readLine()!)!
let m = Int(readLine()!)!

var dic = [Int: [Int]]()

for i in 1...n {
    dic[i] = []
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    if let _ = dic[input[0]] {
        dic[input[0]]!.append(input[1])
    }
    
    if let _ = dic[input[1]] {
        dic[input[1]]!.append(input[0])
    }
}

print(bfs())


func bfs() -> Int {
    var que: [Int] = [1]
    var visited = [Bool](repeating: false, count: n+1)
    visited[1] = true
    var index = 0
    var result = 0
    
    while index < que.count {
        let current = que[index]

        for a in dic[current]! {
            if !visited[a] {
                que.append(a)
                visited[a] = true
                result += 1
            }
        }
        
        index += 1
    }
    
    return result
}