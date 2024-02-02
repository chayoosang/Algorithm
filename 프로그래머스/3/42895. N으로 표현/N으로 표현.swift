import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    
    if N == number {
        return 1
    }
    
    var result = -1
    
    func check(_ count: Int, _ now: Int) {
        if count > 8 {
            return
        }
        
        if now == number {
            if count < result || result == -1 {
                result = count
            }
        }
        var newNum = 0
        for i in 0..<8 {
            if result != -1 && result < count + i + 1 {
                break
            }else {
                newNum = newNum * 10 + N
                check(count + i + 1, now + newNum)
                check(count + i + 1, now - newNum)
                check(count + i + 1, now * newNum)
                check(count + i + 1, now / newNum)
            }
        }
    }
    
    check(0, 0)
    
    return result
}