var result: Int = 0

func dfs(_ numbers:[Int], _ index: Int, _ target: Int, _ sum: Int) {
    if index == numbers.count {
        if target == sum {
            result += 1
        }
        return
    }
    
    dfs(numbers, index + 1, target, sum + numbers[index])
    dfs(numbers, index + 1, target, sum - numbers[index])
}


func solution(_ numbers:[Int], _ target:Int) -> Int {
    dfs(numbers, 0, target, 0)
    
    return result
}
