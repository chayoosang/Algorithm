import Foundation

func solution(_ board:[String]) -> Int {
    var newBoard : [[String]] = []
    var oCount = 0
    var xCount = 0
    var oBingo = 0
    var xBingo = 0
    
    board.forEach {
        let input = $0.map{String($0)}
        newBoard.append(input)
        
        input.forEach {
            if $0 == "O" {
                oCount += 1
            }else if $0 == "X" {
                xCount += 1
            }
        }
    }
    if oCount == 0 && xCount == 0 {return 1}

    if oCount < xCount || oCount > xCount + 1 {return 0}
    
    func checkLine() {

        for line in newBoard {
            if !line.contains("X") && !line.contains(".") {
                oBingo += 1
            }
            
            if !line.contains("O") && !line.contains(".") {
                xBingo += 1
            }
        }
        
    }
    
    func checkRow() {
        for i in 0..<newBoard.count {
            var oCount = 0
            var xCount = 0
            
            for j in 0..<newBoard.count {
                if newBoard[j][i] == "O" {
                    oCount += 1
                }
                
                if newBoard[j][i] == "X" {
                    xCount += 1
                }
                
            }
            
            if oCount == 3 {
                oBingo += 1
            }
            
            if xCount == 3 {
                xBingo += 1
            }
        }
        
    }
    
    func checkDiagonal() {
        let diagonalList = [[(0,0), (1,1), (2,2)], [(0,2), (1,1), (2,0)]]
        
        for diagonal in diagonalList {
            var oCount = 0
            var xCount = 0
            diagonal.forEach {
                if newBoard[$0.0][$0.1] == "O" {
                    oCount += 1
                }
                
                if newBoard[$0.0][$0.1] == "X" {
                    xCount += 1
                }
                
            }
            
            if oCount == 3 {
                oBingo += 1
            }
            
            if xCount == 3 {
                xBingo += 1
            }
        }
    }
    
    let funcList: [()] = [checkLine(), checkRow(), checkDiagonal()]
    
    for ff in funcList {
        ff
    }
    
    if oBingo == 2 {return 1}
    
    if oBingo + xBingo >= 2 {return 0}
    
    if oBingo == 1 && oCount <= xCount {return 0}
    
    if xBingo == 1 && oCount > xCount {return 0}
    
    
    
    return 1
}