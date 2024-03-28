import Foundation

var start: [Int] = []
var parkList: [[String]] = []
var xEnd = 0
var yEnd = 0
func movePark(_ x: Int, _ y: Int) {
    if 0 <= start[0] + x && start[0] + x < xEnd && 0 <= start[1] + y && start[1] + y < yEnd {
        let maxX = max(start[0], start[0] + x)
        let minX = min(start[0], start[0] + x)
        
        let maxY = max(start[1], start[1] + y)
        let minY = min(start[1], start[1] + y)
        
        for i in minX...maxX {
            for j in  minY...maxY {
                if parkList[i][j] == "X" {
                    return
                }
            }
        }
        
        start[0] += x
        start[1] += y
    }
}


func solution(_ park:[String], _ routes:[String]) -> [Int] {
    xEnd = park.count
    yEnd = park[0].count
    
    parkList = [[String]](repeating: [String](repeating: "", count: yEnd), count: xEnd)
   
    for i in 0..<xEnd {
        let a = park[i].map{String($0)}
        for j in 0..<yEnd {
            if a[j] == "S" {
                start = [i, j]
            }
            parkList[i][j] = a[j]
        }
    }
    
    routes.forEach {
        let move = $0.split(separator: " ").map{String($0)}
        
        switch move[0] {
        case "E":
            movePark(0, Int(move[1])!)
            break
        case "W":
            movePark(0, -Int(move[1])!)
            break
        case "N":
            movePark(-Int(move[1])!, 0)
            break
        case "S":
            movePark(Int(move[1])!, 0)
            break
        default:
            break
        }
    }
    
    
    return start
}