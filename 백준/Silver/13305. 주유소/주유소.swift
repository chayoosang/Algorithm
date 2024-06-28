import Foundation

let n = Int(readLine()!)

let km = readLine()!.split(separator: " ").map{Int($0)!}
let price = readLine()!.split(separator: " ").map{Int($0)!}

var result = km.first! * price.first!

var index = 1
var left = 0
var right = 1

while index < km.count {
    if price[left] > price[right] {
        result += km[index] * price[right]
        
        left = right
        right = left + 1
    }else {
        result += km[index] * price[left]
        
        right += 1
    }
    
    index += 1
}

print(result)
