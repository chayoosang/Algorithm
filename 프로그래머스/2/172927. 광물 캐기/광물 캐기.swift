import Foundation

var dic: [String: [Int]] = ["diamond": [1, 5, 25], "iron": [1, 1, 5], "stone": [1, 1, 1]]
var mList: [String] = []
var pList: [Int] = []
var minValue = Int.max

func bfs(_ index: Int, _ start: Int, _ count: Int) {
    var sum = count
    
   if sum > minValue {
        return
    }
    
    for i in start..<start+5 {
        if i == mList.count {
            minValue = min(minValue, sum)
            return
        }
        sum += dic[mList[i]]![index]
        
        if sum > minValue {
        return
        }
    }
    
 
    
    var isZero = true
    for i in 0..<pList.count {
        if pList[i] != 0 {
            pList[i] -= 1
            bfs(i, start+5, sum)
            pList[i] += 1
            isZero = false
        }
    }
    
    if isZero {
        minValue = min(minValue, sum)
    }
}


func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    mList = minerals
    pList = picks
    
    for i in 0..<pList.count {
        if pList[i] != 0 {
            pList[i] -= 1
            bfs(i, 0, 0)
            pList[i] += 1
        }
    }

    return minValue
}