import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var x = 0
    var dic: [Int: Int] = [:]
    
    while Int(pow(Double(x), 2)) <= Int(pow(Double(d), 2)) {
        let maxY = Int(sqrt(Double(Int(pow(Double(d), 2)) - Int(pow(Double(x), 2)))))
        
        dic[x] = (maxY / k) + 1
        x += k
    }
    
    
    var result = dic.map {
        $0.value
    }.reduce(0){
        $0 + $1
    }
    
    return Int64(result)
}