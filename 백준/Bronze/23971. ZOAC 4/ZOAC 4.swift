import Foundation

let input = readLine()!.split(separator: " ").map {Double($0)!}
let a = Int(ceil(input[0]/(input[2]+1)))
let b = Int(ceil(input[1]/(input[3]+1)))

print(a*b)