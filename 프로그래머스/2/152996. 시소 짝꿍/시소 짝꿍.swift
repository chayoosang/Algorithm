func solution(_ weights:[Int]) -> Int64 {
    var count = 0
    var dic: [Double: Int] = [:]
    
    weights.forEach {
        if let _ = dic[Double($0)] {
            dic[Double($0)]! += 1
        }else {
            dic[Double($0)] = 1
        }
    }
    
    dic.forEach {
        if $0.value > 1 {
            count += ($0.value * ($0.value - 1)) / 2
        }
        
        if let two =  dic[$0.key * 2] {
            count += $0.value * two
        }
        
        if let three = dic[$0.key * 2/3] {
            count += $0.value * three
        }
        
        if let four = dic[$0.key * 3/4] {
            count += $0.value * four
        }
    }
    
     
    return Int64(count)
}