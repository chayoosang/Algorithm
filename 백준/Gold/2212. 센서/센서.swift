let n = Int(readLine()!)!
let k = Int(readLine()!)!

var input = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var dis: [Int] = []

if k >= n {
    print(0)
}else {
    for i in 0..<n-1 {
        dis.append(input[i + 1] - input[i])
    }
    
    dis.sort(by: >)
    print(dis[k-1...dis.count-1].reduce(0, +))
}

