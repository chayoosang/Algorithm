class Solution {
    



    public int solution(int m, int n, int[][] puddles) {
        int[][] memo = new int[n][m];

        for (int j = 0; j<puddles.length; j++) {
            memo[puddles[j][1] - 1][puddles[j][0] - 1] = -1;
        }

        memo[0][0] = 1;

        for(int i=0; i< memo.length; i++) {
            for(int j=0; j<memo[0].length; j++) {
                if (memo[i][j] == -1) {
                    memo[i][j] = 0;
                    continue;
                }

                if(i != 0) {
                    memo[i][j] += memo[i-1][j] % 1000000007;
                }

                if (j != 0) {
                    memo[i][j] += memo[i][j-1] % 1000000007;
                }
            }
        }


        return memo[n-1][m-1] % 1000000007;
    }
}