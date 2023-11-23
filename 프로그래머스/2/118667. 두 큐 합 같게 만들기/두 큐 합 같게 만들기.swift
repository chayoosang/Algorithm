import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let array: [Int] = queue1 + queue2
    
    var lStart = 0
    var lEnd = queue1.count
    var lSum = queue1.reduce(0, +)
    var rSum = queue2.reduce(0, +)
    
    let goal = (lSum + rSum) / 2
    var count = 0
    
    if (lSum + rSum) % 2 != 0 {
        return -1
    }
    
    while (lStart < array.count && lEnd < array.count) {
        if goal > lSum {
            lSum += array[lEnd]
            lEnd += 1
        }else if goal < lSum {
            lSum -= array[lStart]
            lStart += 1
        }else {
            break
        }
        count += 1
    }
    
    if lSum != goal {
        return -1
    }
    
    return count
}