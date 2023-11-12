import java.util.*;
import java.lang.*;

class Solution {
  String[][] tickets;
    ArrayList<String> answer;
    boolean[] visit;


    public void dfs(int count, String city, String path) {
        if (count == tickets.length) {
            answer.add(path);
        }


        for(int i=0; i<tickets.length; i++) {
            if (tickets[i][0].equals(city) && !visit[i]) {
                visit[i] = true;
                dfs( count + 1, tickets[i][1], path + " " + tickets[i][1]);
                visit[i] = false;
            }
        }
    }
    public String[] solution(String[][] tickets) {
        this.tickets = tickets;
        this.visit = new boolean[tickets.length];
        answer = new ArrayList<>();

        Arrays.fill(visit, false);
        dfs(0, "ICN", "ICN");

        Collections.sort(answer);

        return answer.get(0).split(" ");
    }
}