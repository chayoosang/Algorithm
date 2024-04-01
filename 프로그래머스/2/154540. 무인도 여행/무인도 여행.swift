import Foundation
func solution(_ maps:[String]) -> [Int] {
    var result: [Int] = []
    var maps = maps.map{$0.map{String($0)}}
    var dots: [(Int, Int)] = []
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: maps[0].count), count: maps.count)
    
    
    for i in 0..<maps.count {
        for j in 0..<maps[0].count {
            if maps[i][j] != "X" {
                dots.append((i, j))
            }
        }
    }
    
    if dots.isEmpty {
        return [-1]
    }
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        if (0...maps.count-1).contains(x) && (0...maps[0].count-1).contains(y) && maps[x][y] != "X" {
            return true
        }
        return false
    }
    

    
    func bfs(_ start: (Int, Int)) {
        let move = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var que: [(Int, Int)] = []
        var count = 0
        var index = 0
        
        que.append(start)
        visited[start.0][start.1] = true
        
        while index < que.count {
            let current = que[index]
            count += Int(maps[current.0][current.1])!
            
            move.forEach {
                let nx = current.0 + $0.0
                let ny = current.1 + $0.1
                if isValid(nx, ny) {
                    if !visited[nx][ny] {
                        que.append((nx, ny))
                        visited[nx][ny] = true
                    }
                }
            }
            
            index += 1
        }
        if count != 0 {
            result.append(count)
        }
    }
    
    dots.forEach {
        if !visited[$0.0][$0.1] {
            bfs($0)
        }
    }
    
    result.sort(by: <)
    
    
    
    return result
}