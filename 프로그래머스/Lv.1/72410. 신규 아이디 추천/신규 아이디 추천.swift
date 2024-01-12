import Foundation

func solution(_ new_id:String) -> String {
   var newId = new_id.lowercased()
    newId = newId.filter{$0.isNumber || $0.isLetter || $0 == "-" || $0 == "_" || $0 == "."}
    while newId.contains("..") {
        newId = newId.replacingOccurrences(of: "..", with: ".")
    }
    if newId.hasPrefix(".") {
        newId.removeFirst()
    }
    if newId.isEmpty {
        newId = "a"
    }
    if newId.count >= 16 {
        newId = String(newId.prefix(15))
    }
    if newId.hasSuffix(".") {
        newId.removeLast()
    }
    while newId.count < 3 {
        newId += String(newId.last!)
    }
    return newId
}