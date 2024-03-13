var sum = 0
var N = 0

func calculate(_ x: Int, _ y: Int, _ count: Int) {
    if count == N {
        return
    }
    
    sum = (x + y) % 1234567
    
    calculate(y % 1234567, sum, count + 1)
}

func solution(_ n:Int) -> Int {
    N = n
    calculate(0 , 1, 1)
    
    return sum
}

