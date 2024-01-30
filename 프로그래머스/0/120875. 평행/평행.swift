import Foundation

func search(_ arr1:[Int], _ arr2:[Int]) -> Double {
    return Double(arr2[1] - arr1[1]) / Double(arr2[0] - arr1[0])
}

func solution(_ dots:[[Int]]) -> Int {
    
    var result = 0
    
    if search(dots[0], dots[1]) == search(dots[2], dots[3]){
        result = 1
    }
    
    if search(dots[0], dots[2]) == search(dots[1], dots[3]){
        result = 1
    }
    
    if search(dots[0], dots[3]) == search(dots[1], dots[2]){
        result = 1
    }
    
    return result
}