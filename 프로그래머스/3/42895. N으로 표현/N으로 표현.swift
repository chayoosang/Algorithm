import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    
    if (N == number) {
          return 1
      }
      
      var answer = -1
      
      func bfs(_ count: Int, _ num: Int) {
          if (count > 8) {
              return
          }
          
          if (num == number) {
              if (count < answer || answer == -1) {
                  answer = count
              }
              return
          }
          
          var calc = 0
          
          for i in 0..<8 {
              if (answer != -1 && answer < count + 1 + i) {
                  break
              }
              
              calc = calc * 10 + N
              
              bfs (count+1 + i, num + calc)
              bfs (count+1 + i, num - calc)
              bfs (count+1 + i, num * calc)
              bfs (count+1 + i, num / calc)
          }
      }
    
    bfs(0, 0)
      
    return answer
    
    
}