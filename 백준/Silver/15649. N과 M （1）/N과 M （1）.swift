let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]


var visited: [Bool] = [Bool](repeating: false, count: n+1)


func bfs(_ list: [Int]) {
    if list.count == m {
        print(list.map {String($0)}.joined(separator: " "))
    }
    
    
    for i in 1...n {
        if visited[i] == false {
            visited[i] = true
            bfs(list + [i])
            visited[i] = false
        }
    }
}

bfs([])