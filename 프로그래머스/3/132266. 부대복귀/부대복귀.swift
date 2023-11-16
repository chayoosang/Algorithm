import Foundation


func bfs(departure: Int, graph: [Int: [Int]], distance: inout [Int]) {
    var queue = [Int]()
    queue.append(departure)
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        let nextNodes = graph[cur, default: []]
        
        for node in nextNodes {
            if distance[node] != -1 { continue }
            distance[node] = distance[cur] + 1
            queue.append(node)
        }
    }
}


func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
     var graph = [Int: [Int]]()
    
    for road in roads {
        graph[road[0], default: []].append(road[1])
        graph[road[1], default: []].append(road[0])
    }
    
    var distance = Array(repeating: -1, count: n+1) 
    distance[destination] = 0
    
    bfs(departure: destination, graph: graph, distance: &distance)
    
    
    return sources.map { distance[$0] }
}