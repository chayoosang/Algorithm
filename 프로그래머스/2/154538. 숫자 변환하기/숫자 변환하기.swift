import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var visited = [Bool](repeating: false, count: y+1)
    
    if x == y {return 0}
    
    func cal1(_ x: Int) -> Int {
        return x + n
    }
    
    func cal2(_ x: Int) -> Int {
        return x * 2
    }
    
    func cal3(_ x: Int) -> Int {
        return x * 3
    }
    

    var que: [(Int, Int)] = []
    
    que.append((x, 0))
    var index = 0
    
    while index < que.count {
        let current = que[index]
        
        if current.0 == y {
            return current.1
        }

        for cal in [cal1, cal2, cal3] {
            let newX = cal(current.0)
            
            if newX <= y {
                if !visited[newX] {
                    visited[newX] = true
                    que.append((newX, current.1 + 1))
                }
            }
        }
        
        index += 1
    }
    
  
    
    return -1
}
