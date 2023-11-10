import java.lang.*;

class Solution {
    public int[] solution(String[] wallpaper) {
        int minX = 51;
        int minY = 51;
        int maxX = -1;
        int maxY = -1;
        
        for (int i=0; i<wallpaper.length; i++) {
            for (int k = 0; k<wallpaper[i].length(); k++) {
                if (wallpaper[i].charAt(k) == '#') {
                    if (minX > k) {
                        minX = k;
                    }
                    if (minY > i) {
                        minY = i;
                    }
                    if (maxX < k) {
                        maxX = k;
                    }
                    if (maxY < i) {
                        maxY = i;
                    }
                }
            }
        }
        
        
        
        int[] answer = {minY, minX, maxY+1, maxX+1};
        return answer;
    }
}