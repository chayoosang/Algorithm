import Foundation

let n = Int(readLine()!)!

var arr: [Bool] = readLine()!.split(separator: " ").map{
    if $0 == "0" {
        return false
    }else{
        return true
    }
}

let m = Int(readLine()!)!
var students = [[Int]]()
for _ in 0..<m {
    students.append(readLine()!.split(separator: " ").map{Int($0)!})
}

for student in students {
    if student[0] == 1 {
        male(student[1])
    }else {
        female(student[1]-1)
    }
}

func male(_ i: Int) {
    for j in stride(from: i, to: n+1, by: i) {
        arr[j-1].toggle()
    }
}

func female(_ i: Int) {
    var right = i
    var left = i
    
    while true {
        if right + 1 < arr.count && left - 1 >= 0 {
            if arr[right + 1] == arr[left - 1] {
                right += 1
                left -= 1
            }else {
                break
            }
        }else {
            break
        }
    }
    
    for j in left...right {
        arr[j].toggle()
    }
}

let a: [String] = arr.map{
    if $0 {
        return "1"
    }else {
        return "0"
    }
}

for i in 0..<n {
    print(a[i], terminator: " ")
    if (i+1)%20 == 0 {
        print()
    }
}

