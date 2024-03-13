var graph: [[Int]] = []
var move: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

var n = 0
var m = 0

func dfs() {
    var que: [(Int, Int)] = []
    que.append((0, 0))
    
    while !que.isEmpty {
        let current = que.removeFirst()
        let x = current.0
        let y = current.1
        
        
        move.forEach {
            if (x+$0.0 >= 0 && x+$0.0 < n) && (y+$0.1 >= 0 && y+$0.1 < m) {
                if graph[x+$0.0][y+$0.1] == 1{
                    graph[x+$0.0][y+$0.1] = graph[x][y] + 1
                    que.append((x+$0.0, y+$0.1))
                }
            }
        }
    }
}


func solution() {
    let input = readLine()!.split(separator: " ").map {Int($0)!}
    n = input[0]
    m = input[1]
    
    
    for _ in 0..<n {
        graph.append(readLine()!.map { Int(String($0))! })
    }
    dfs()
    
    print(graph[n-1][m-1])
}

solution()
