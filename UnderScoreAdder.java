// WAP to add "_" after every string in a given string array

// Sample Input:
// Longest Subarray of 1's After Deleting One Element
// Sample Output:
// Longest_Subarray_of_1's_After_Deleting_One_Element

import java.util.Scanner;

class UnderScoreAdder
{
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            System.out.println("Enter the string: ");
            String str = sc.nextLine();
            String[] strArr = str.split(" ");
            String result = "";
            for(int i=0; i<strArr.length; i++)
            {
                result += strArr[i] + "_";
            }
            System.out.println(result);
        }
    }
}

// How to add link in markdown file
// [Link Text](Link)