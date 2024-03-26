import Foundation

func solution(_ operations:[String]) -> [Int] {
    var que: [Int] = []
    
    operations.forEach {
        let input = $0.split(separator: " ")
        let spel = String(input[0])
        let num = Int(input[1])!
        
        switch spel {
        case "I":
            que.append(num)
            que.sort(by: >)
            break
        case "D":
            if !que.isEmpty {
                if num == 1 {
                    que.removeFirst()
                }else {
                    que.removeLast()
                }
            }
            break
        default:
            break
        }
    }
    
    if que.isEmpty {
        return [0, 0]
    }else {
        return [que.first!, que.last!]
    }
}