import java.lang.*;
import java.util.*;

class Solution {
    public int[] solution(String[] park, String[] routes) {
         boolean[][] newPark = new boolean[park.length][park[0].length()];
         int h = 0;
        int w = 0;

        for (int i = 0; i < newPark.length; i++) {
            for (int j = 0; j < newPark[i].length; j++) {
                char c = park[i].charAt(j);

                if (c == 'S' || c == 'O') {
                    if (c == 'S') {
                        h = j;
                        w = i;
                    }
                    newPark[i][j] = true;
                } else {
                    newPark[i][j] = false;
                }
            }
        }

       

        for (int k = 0; k < routes.length; k++) {
            char arrow = routes[k].charAt(0);
            int move = Character.getNumericValue(routes[k].charAt(2));

            boolean check = true;
            switch (arrow) {
                case 'E':
                    if (h + move > newPark[w].length - 1) {
                        break;
                    } else {
                        for (int i = h; i<=h+move; i++){
                            if (!newPark[w][i]) {
                                check = false;
                            }
                        }
                        if (check) {
                            h += move;
                        }

                    }
                    break;
                case 'S':
                    if (w + move > newPark.length - 1) {
                        break;
                    } else {
                        for (int i = w; i<=w+move; i++){
                            if (!newPark[i][h]) {
                                check = false;
                            }
                        }
                        if (check) {
                            w += move;
                        }
                    }
                    break;
                case 'W':
                    if (h - move < 0) {
                        break;
                    } else {
                        for (int i = h; i>=h-move; i--){
                            if (!newPark[w][i]) {
                                check = false;
                            }
                        }
                        if (check) {
                            h -= move;
                        }
                    }
                    break;
                case 'N':
                    if (w - move < 0) {
                        break;
                    } else {
                        for (int i = w; i>=w-move; i--){
                            if (!newPark[i][h]) {
                                check = false;
                            }
                        }
                        if (check) {
                            w -= move;
                        }
                    }
                    break;
                default:
                    break;
            }
        }


        int[] answer = {w, h};
        return answer;
    }
}