let input = readLine()!.split(separator: " ").map{Int($0)!}
let k = input[1]

var arr = readLine()!.map{String($0)}
var count = 0

for i in 0..<arr.count {
    if arr[i] != "P" {continue}
    
    for j in (i - k)...(i + k) {
        if 0..<arr.count ~= j && arr[j] == "H" {
            arr[j] = ""
            count += 1
            break
        }
    }
}

print(count)
