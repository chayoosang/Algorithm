import Foundation

var input = readLine()!
var split = readLine()!
var count = 0

while true {
    if let range = input.range(of: split) {
        input = String(input.suffix(from: range.upperBound))
        count += 1
    }else {
        break
    }
}

print(count)