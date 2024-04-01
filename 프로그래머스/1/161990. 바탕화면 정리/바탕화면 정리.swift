import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    let wallpaper = wallpaper.map{$0.map{String($0)}}
    var x: [Int] = []
    var y: [Int] = []
    
    for i in 0..<wallpaper.count {
        for j in 0..<wallpaper[0].count {
            if wallpaper[i][j] == "#" {
                x.append(i)
                y.append(j)
            }
        }
    }
    
    let lux = x.min()!
    let luy = y.min()!
    
    let rdx = x.max()! + 1
    let rdy = y.max()! + 1
    
    return [lux, luy, rdx, rdy]
}