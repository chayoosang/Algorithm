func solution(_ s:String, _ n:Int) -> String {
    var result:[String] = []
    
    for char in s.unicodeScalars {
        var dec = Int(char.value)+n
        
        if Int(char.value) == 32 {
            dec = Int(char.value)
        }
        
        if (Int(char.value) <= 90 && dec > 90) || dec > 122 {
            dec = dec - 26
        }
        
        
        result.append(String(UnicodeScalar(dec)!))
    }
    
    return result.joined(separator: "")
}