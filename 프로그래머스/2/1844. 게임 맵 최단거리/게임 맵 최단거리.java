import java.util.*;

class Node {
    int x;
    int y;
    
    public Node(int x, int y) {
        this.x = x;
        this.y = y;
    }
}

class Solution {
    int[][] dp;
    int[][] maps;

    int[] xArrow = {0, 0, 1, -1};
    int[] yArrow = {1, -1, 0, 0};

    public void bfs() {
        dp[0][0] = 1;
        Deque<Node> que = new ArrayDeque<>();

        que.add(new Node(0, 0));

        while(!que.isEmpty()) {
            Node node = que.poll();

            for(int i =0; i<xArrow.length; i++) {
                Node next = new Node(node.x + xArrow[i], node.y + yArrow[i]);
                if(next.x > -1 && next.x < maps.length && next.y > -1 && next.y < maps[0].length) {
                    if (maps[next.x][next.y] == 1 && dp[next.x][next.y] == -1) {
                        dp[next.x][next.y] = dp[node.x][node.y] + 1;
                        que.add(next);
                    }
                }
            }

        }

    }


    public int solution(int[][] maps) {
        this.maps = maps;
        this.dp = new int[maps.length][maps[0].length];

        for(int[] j : dp) Arrays.fill(j, -1);


        bfs();


        return dp[maps.length-1][maps[0].length-1];
    }
}