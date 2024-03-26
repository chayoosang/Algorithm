import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    

    var start = 0
    var end = times.max()! * n
    var result = 0
    
    while (start <= end) {
        var count = 0
        var mid = (start + end) / 2
        
        for time in times {
            count += mid / time
            if count >= n {
                break
            }
        }
        
        if count >= n {
            result = mid
            end = mid - 1
        }else if count < n {
            start = mid + 1
        }
    }
    
    return Int64(result)
}