func solution() {
    let input = Int(readLine()!)!
    var count = 1
    var past = 0
    
    if input == 1 {
        print(1)
        return
    }
    
    while true{
        if (6*past) + 2 <= input && (6*(past+count)) + 1 >= input {
            break
        }
        past = past+count
        count += 1
        
    }
    
    print(count+1)
}
solution()