import Foundation

func solution(_ todo_list:[String], _ finished:[Bool]) -> [String] {
    var result: [String] = [];
    for i in (0..<finished.count) {
        if !finished[i] {
            result.append(todo_list[i])
        }
    }
    
    return result
}