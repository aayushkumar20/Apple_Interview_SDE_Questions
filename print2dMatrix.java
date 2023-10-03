// WAP to print a 2d matrix

// Sample Input: 
// 3
// -1 -1 -1
// 3 4 5
// -1 -1 -1
// Sample Output:
// 3 4 5

// Sample Input:
// 5
// -1 -1 -1 -1
// 3 4 5 6
// -1 -1 -1 -1
// 7 8 9 10
// Sample Output:
// 3 4 5 6
// 7 8 9 10

import java.util.*;

public class print2dMatrix {
    public static void main(String[] args) {
        try (Scanner scn = new Scanner(System.in)) {
            int r = scn.nextInt();
            ArrayList<ArrayList<Integer>> arr = new ArrayList<>();
            try (Scanner scn2 = new Scanner(System.in)) {
                for (int i = 0; i < r; i++) {
                    String str = scn2.nextLine();
                    String[] sArr = str.split(" ");
                    ArrayList<Integer> temp = new ArrayList<>();
                    for (int j = 0; j < sArr.length; j++) {
                        temp.add(Integer.parseInt(sArr[j]));
                    }
                    arr.add(temp);
                }
            }
            for (int i = 0; i < arr.size(); i++) {
                if (arr.get(i).get(0) != -1) {
                    for (int j = 0; j < arr.get(i).size(); j++) {
                        System.out.print(arr.get(i).get(j) + " ");
                    }
                    System.out.println();
                }
            }
        } catch (NumberFormatException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}