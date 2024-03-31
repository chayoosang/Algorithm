import Foundation

func solution(_ maps:[String]) -> Int {
    var startPoint = (0, 0)
    var leverPoint = (0, 0)
    var endPoint = (0, 0)
    
    let map = maps.map{$0.map{String($0)}}
    
    
    
    
    
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            if map[i][j] == "S" {
                startPoint = (i, j)
            }else if map[i][j] == "L" {
                leverPoint = (i , j)
            }else if map[i][j] == "E" {
                endPoint = (i, j)
            }
        }
    }
    
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        (0..<map.count).contains(x) && (0..<map[0].count).contains(y) && map[x][y] != "X"
    }
    
    
    
    
    func bfs(_ start: (Int, Int), _ end: (Int, Int)) -> Int {
        let move = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: maps[0].count), count: maps.count)
        
        
        var que: [(Int, Int, Int)] = []
        
        que.append((start.0, start.1, 0))
        visited[start.0][start.1] = true
        
        
        while !que.isEmpty {
            let current = que.removeFirst()
            
            
            
            
            if current.0 == end.0 && current.1 == end.1 {
                return current.2
            }
            
            
            move.forEach {
                let nx = current.0 + $0.0
                let ny = current.1 + $0.1
                
                if isValid(nx, ny) {
                    if !visited[nx][ny] {
                        que.append((nx, ny, current.2 + 1))
                        visited[nx][ny] = true
                    }
                }
            }
        }
        
        return -1
    }
    
    let leverCount = bfs(startPoint, leverPoint)
    let endCount = bfs(leverPoint, endPoint)
    
    if leverCount != -1 && endCount != -1 {
        return leverCount + endCount
    }
    
    
    
    
    return -1
}

