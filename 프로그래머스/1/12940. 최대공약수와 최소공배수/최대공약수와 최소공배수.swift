import Foundation

var max = 0

func solution(_ n:Int, _ m:Int) -> [Int] {
    var nn = 0
    var mm = 0
    if n > m {
        nn = m
        mm = n
    }else {
        nn = n
        mm = m
    }
    
    
    while nn % mm != 0 {
        max = nn % mm
        nn = mm
        mm = max
    }
    
    
    
    return [max, (n*m)/max]
}
