import Foundation

var supo: [Int: [Int]] = [1 : [1, 2, 3, 4, 5], 2 : [2, 1, 2, 3, 2, 4, 2, 5], 3: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
var totalCount: [Int: Int] = [1: 0, 2: 0, 3: 0]


func solution(_ answers:[Int]) -> [Int] {
    for i in 1..<4 {
        var copy = answers
        var index = 0
        
        while !copy.isEmpty {
            if index >= supo[i]!.count {
                index = 0
            }
            let anw = copy.removeFirst()
            let su = supo[i]![index]
            
            if su == anw {
                 totalCount[i] = totalCount[i]! + 1
            }
            
            index += 1
        }
    }
    
    let sort = totalCount.sorted {
        return $0.value > $1.value
    }
    
    var result: [Int] = []
    var max = 0
    
    if sort.first!.value != 0 {
        max = sort.first!.value
    }else {
        return []
    }
    
    sort.forEach {
        if $0.value == max {
           result.append($0.key)
       }
    }
    
    result.sort()
    
    return result
}