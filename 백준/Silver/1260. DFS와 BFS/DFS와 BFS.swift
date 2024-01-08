import Foundation

var visited: [Bool] = []
var graph: [Int : [Int]] = [:]

var bfsArray: [String] = []
var dfsArray: [String] = []

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    
    for _ in 0..<input[1] {
        let inputG = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        graph[inputG[0], default: []].append(inputG[1])
        graph[inputG[1], default: []].append(inputG[0])
    }
    
    for i in 1...input[1] {
        guard let node = graph[i] else {continue}
        graph[i] = node.sorted(by: <)
    }
    

    visited = [Bool](repeating: false, count: input[0])
    
    dfs(input[2])
    visited = [Bool](repeating: false, count: input[0])
    bfs(input[2])
    print(dfsArray.joined(separator: " "))
    print(bfsArray.joined(separator: " "))
    

    
}

func bfs(_ root: Int) {
    var queue: [Int] = []
    visited[root - 1] = true
    
    bfsArray.append(root.description)
    
    
    guard let node = graph[root] else {return}
    
    node.forEach {
        queue.append($0)
    }
    
    
    while !queue.isEmpty {
        let next = queue.removeFirst()
        
        if !visited[next - 1] {
            bfsArray.append(next.description)
            visited[next - 1] = true
            
            guard let node = graph[next] else {return}
            
            node.forEach {
                queue.append($0)
            }
        }
    }
    
}

func dfs(_ node: Int) {
    visited[node - 1] = true
    dfsArray.append(node.description)
    
    guard let node = graph[node] else {return}
    
    node.forEach {
        if !visited[$0 - 1] {
            dfs($0)
        }
    }
    
}

solution()
