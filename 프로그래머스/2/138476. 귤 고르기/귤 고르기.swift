import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dic: [Int: Int] = [:]
    
    for tang in tangerine {
        if let _ = dic[tang] {
            dic[tang]! += 1
        }else {
            dic[tang] = 1
        }
    }
    
    var sort = dic.sorted {
        $0.value > $1.value
    }.map{$0.value}
    
    var kk = k
    var result = 0
    
    while kk > 0 {
        kk -= sort.removeFirst()
        result += 1
    }
    
    
    return result
}