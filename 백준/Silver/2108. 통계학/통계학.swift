import Foundation

let n = Int(readLine()!)!
var list: [Int] = []
var count: [Int: Int] = [:]

for _ in 0..<n {
    let input = Int(readLine()!)!
    list.append(input)
    count.updateValue((count[input] ?? 0) + 1 , forKey: input)
}

print(Int(round(Double(list.reduce(0, { $0 + $1})) / Double(n))))
print(list.sorted(by: >)[n/2])

if n != 1 {
    let sortCount = count.sorted {
        $0.value > $1.value
    }
    if sortCount[0].value == sortCount[1].value {
        var arr: [Int] = []
        
        sortCount.forEach {
            if $0.value == sortCount[0].value {
                arr.append($0.key)
            }
        }
        
        print(arr.sorted(by: <)[1])
    }else {
        print(sortCount[0].key)
    }
}else {
    print(count.first!.key)
}


print((list.max()! - list.min()!))
