import Foundation

var result: [String] = []
var visited: [String: Bool] = [:]
var nowTime: Int = 0
var isFirst = true


func bfs(_ sortDic: [Dictionary<String, (Int, Int)>.Element]) {
    var que: [(String, Int)] = []
    nowTime = sortDic.first!.value.0
    que.append((sortDic.first!.key, sortDic.first!.value.1 - sortDic.first!.value.0))
    
    
    while !que.isEmpty {
        let current = que.removeFirst()
        visited[current.0] = true
        var isEnd = true
        
        for sort in sortDic {
            if sort.key == current.0 {
                continue
            }
            if !visited[sort.key]! {
                if nowTime < sort.value.0 && sort.value.0 < nowTime + current.1 {
                    que.insert((current.0, current.1 - (sort.value.0 - nowTime)), at: 0)
                    que.insert((sort.key, sort.value.1 - sort.value.0), at: 0)
                    
                    nowTime = sort.value.0
                    isEnd = false
                    break
                }
                
                if nowTime + current.1 == sort.value.0 {
                    que.insert((sort.key, sort.value.1 - sort.value.0), at: 0)
                    break
                }
            }
        }
        
        if isEnd {
            result.append(current.0)
            nowTime += current.1
            if que.isEmpty {
                for sort in sortDic {
                    if !visited[sort.key]! {
                        if nowTime < sort.value.0{
                            que.insert((sort.key, sort.value.1 - sort.value.0), at: 0)
                            nowTime = sort.value.0
                            break
                        }
                    }
                }
            }
        }
        
        
        
    }
}

func solution(_ plans:[[String]]) -> [String] {
    var planDic: [String: (Int, Int)] = [:]
    plans.forEach { time in
        let start = time[1].split(separator: ":").map{Int($0)!}
        planDic[time[0]] = ((start[0]*60 + start[1]) , (start[0]*60 + start[1]) + Int(time[2])!)
        visited[time[0]] = false
    }
    
    let sortDic = planDic.sorted {
        return $0.value.0 < $1.value.0
    }
    
    bfs(sortDic)

    
    return result
}
