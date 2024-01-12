func solution(_ phone_number:String) -> String {
    let count = phone_number.count
    let star = String(repeating: "*", count: count - 4)
    
    return star + String(phone_number.suffix(4))
}