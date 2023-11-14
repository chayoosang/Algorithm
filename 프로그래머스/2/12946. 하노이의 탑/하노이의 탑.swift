import Foundation

func solution(_ n:Int) -> [[Int]] {
   var result: [[Int]] = []

func hanoi(n: Int, start: Int, finish: Int, mid: Int) {
    if (n == 1) {
        result.append([start, finish])
    }else {
        hanoi(n: n-1, start: start, finish: mid, mid: finish)
        result.append([start, finish])
        hanoi(n: n-1, start: mid, finish: finish, mid: start)
    }
}

hanoi(n: n, start: 1, finish: 3, mid: 2)

    return result
}