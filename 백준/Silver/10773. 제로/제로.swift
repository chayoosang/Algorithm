import Foundation

let k = Int(readLine()!)!
var list: [Int] = []

for _ in 0..<k {
    let input = Int(readLine()!)!
    
    if input == 0 {
        if !list.isEmpty {
            list.removeLast()
        }
    }else {
        list.append(input)
    }
}

print(list.reduce(0, {$0 + $1}))