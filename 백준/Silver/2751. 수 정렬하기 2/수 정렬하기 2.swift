var nums: [Int] = []
var n = Int(readLine()!)!

for _ in 0..<n {
    nums.append(Int(readLine()!)!)
}

nums.sort(by: <)

nums.forEach {
    print($0)
}
