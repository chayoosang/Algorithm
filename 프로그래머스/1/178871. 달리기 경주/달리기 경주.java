import java.util.*;

class Solution {
    public String[] solution(String[] players, String[] callings) {
         HashMap<String, Integer> rank = new HashMap<>();

        for (int i =0; i<players.length; i++) {
            rank.put(players[i], i);
        }

        for (int j = 0; j<callings.length; j++) {
            int grade = rank.get(callings[j]);
            
            String before = players[grade-1];

            players[grade - 1] = players[grade];
            rank.put(players[grade], grade - 1);
            
            players[grade] = before;
            rank.put(before, grade);
        }



        return players;
    }
}