let m = Int(readLine()!)!
let n = Int(readLine()!)!

var sum = 0
var num: [Int] = []
var isPrime = true


for i in m...n{
    if i == 1 {
        isPrime = false
    }else {
        for j in 2..<i {
            if i % j == 0 {
                isPrime = false
            }
        }
        
        if isPrime {
            num.append(i)
        }
    }
    isPrime = true
}

if num.isEmpty {
    print("-1")
}else {
    num.forEach {
        sum += $0
    }
    
    print(sum.description)
    print(num.min()!.description)
}