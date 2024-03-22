import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var rank = [String: Int]()
    var players = players
   
    for i in 0..<players.count {
        rank[players[i], default: 0] = i
    }

    for calling in callings {
        let index = rank[calling]!
        let player = players[index-1]
       
        rank[calling]! -= 1
        rank[players[index-1]]! += 1
       
        players.swapAt(index, index-1)
    }

    return players
}

