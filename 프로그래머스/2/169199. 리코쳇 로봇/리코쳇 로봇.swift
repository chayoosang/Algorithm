import Foundation

func solution(_ board:[String]) -> Int {
    var cost = 0
    let board = board.map { $0.map { String($0) } }
    
    func isValid(_ r: Int, _ c: Int) -> Bool {
        (0..<board.count).contains(r) && (0..<board[0].count).contains(c) && board[r][c] != "D"
    }
    
    func slideToTop(_ r: Int, _ c: Int) -> (Int, Int) {
        var nr = r
        while isValid(nr - 1, c) {
            nr -= 1
        }
        return (nr, c)
    }

    func slideToBottom(_ r: Int, _ c: Int) -> (Int, Int) {
        var nr = r
        while isValid(nr + 1, c) {
            nr += 1
        }
        return (nr, c)
    }
    
    func slideToLeft(_ r: Int, _ c: Int) -> (Int, Int) {
        var nc = c
        while isValid(r, nc - 1) {
            nc -= 1
        }
        return (r, nc)
    }
    
    func slideToRight(_ r: Int, _ c: Int) -> (Int, Int) {
        var nc = c
        while isValid(r, nc + 1) {
            nc += 1
        }
        return (r, nc)
    }
    let moves = [slideToTop, slideToBottom, slideToLeft, slideToRight]
    
    var q:[(Int, Int, Int)] = []
    var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    
    var r = (0, 0)
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if board[i][j] == "R" {
                r = (i, j)
            }
        }
    }
    
    q.append((r.0, r.1, 0))
    visited[r.0][r.1] = true
    
    while !q.isEmpty {
        let now = q.removeFirst()
        if board[now.0][now.1] == "G" { return now.2 }
        
        for i in 0..<4 {
            let (nr, nc) = moves[i](now.0, now.1)
            if !visited[nr][nc] {
                q.append((nr, nc, now.2 + 1))
                visited[nr][nc] = true
            }
        }
    }
    
    return -1
}