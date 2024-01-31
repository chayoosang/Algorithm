var graph: [Int: [Int]] = [:]
var visited: [Bool] = []
var count = 0

func dfs(_ start: Int) {
    visited[start] = true
    count += 1
    
    graph[start]?.forEach({
        if visited[$0] == false {
            dfs($0)
        }
    })
}


func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var minValue: Int = 1000
    
    for i in 0..<n {
        graph[i+1] = []
    }
    
    wires.forEach {
        graph[$0[0]]!.append($0[1])
        graph[$0[1]]!.append($0[0])
    }
    
    for i in 1..<n+1 {
        if let last = graph[i]?.count {
            for _ in 0..<last {
                count = 0
                visited = [Bool](repeating: false, count: n+1)
                visited[i] = true
                
                var first = graph[i]!.removeFirst()
                dfs(first)
                graph[i]?.append(first)
                
                
                minValue = min(minValue, abs(count - (n - count)))
            }
        }
    }
    
        
    return minValue
}