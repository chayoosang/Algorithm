func solution(_ seoul:[String]) -> String {
    let index = seoul.firstIndex(of: "Kim")
    return "김서방은 "+index!.description+"에 있다"
}