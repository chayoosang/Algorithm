import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
     var result: [[Character : Int]] = [["R":0, "T":0], ["C":0, "F":0], ["J":0, "M":0], ["A":0, "N":0]]
    
    func serachAdd(_ char: Character, _ count: Int) {
        if char == "R" || char == "T" {
            result[0][char] = result[0][char]! + count
        }else if char == "C" || char == "F" {
            result[1][char] = result[1][char]! + count
        }else if char == "J" || char == "M" {
            result[2][char] = result[2][char]! + count
        }else {
            result[3][char] = result[3][char]! + count
        }
    }
    
    
       
        for i in 0..<survey.count {
            var a = Array(survey[i])
            print(a)
            switch choices[i] {
            case 1 :
                serachAdd(a[0], 3)
            case 2 :
                serachAdd(a[0], 2)
            case 3 :
                serachAdd(a[0], 1)
            case 5 :
                serachAdd(a[1], 1)
            case 6 :
                serachAdd(a[1], 2)
            case 7 :
                serachAdd(a[1], 3)
            default:
                break
            }
        }
    
    var resultStr = ""
    
    result.forEach { results in
        var sortResult = results.sorted {
            if $0.value == $1.value {
                return $0.key < $1.key
            }
            return $0.value > $1.value
        }
        
        resultStr.append(String(sortResult.first!.key))
    }
    
    
    return resultStr
}