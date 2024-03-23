var move: [(Int, Int)] = [(1,0), (-1,0), (0,1), (0,-1)]
var vegList: [(Int, Int)] = []

var m = 0
var n = 0
var k = 0
var count = 0



func bfs() {
    if vegList.isEmpty {
        return
    }
    
    count += 1
    var que: [(Int, Int)] = []
    
    que.append(vegList.removeFirst())
    
    while !que.isEmpty {
        let veg = que.removeFirst()
        
        move.forEach {
            let x = veg.0 + $0.0
            let y = veg.1 + $0.1
            
            if x >= 0 && x < m && y >= 0 && y < n {
                if vegList.contains(where: {$0.0 == x && $0.1 == y}) {
                    let index = vegList.firstIndex(where: {$0.0 == x && $0.1 == y})!
                    que.append(vegList.remove(at: index))
                }
            }
        }
    }
    
    bfs()
}



func solution() {
    var t = Int(readLine()!)!
    
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        m = input[0]
        n = input[1]
        k = input[2]
        count = 0
        vegList = []
        
        for _ in 0..<k {
            let veg = readLine()!.split(separator: " ").map{Int($0)!}
            vegList.append((veg[0], veg[1]))
        }
        
        bfs()
        
        print(count)
    }
}

solution()