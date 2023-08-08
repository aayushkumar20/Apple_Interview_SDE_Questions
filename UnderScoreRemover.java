// WAP to remove '_' from the string and add a white space in place of it.

import java.util.Scanner;

class UnderScoreRemover{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the string with underscore: ");
        String str = sc.nextLine();
        String newStr = str.replace('_', ' ');
        System.out.println("String after removing underscore: " + newStr);
        sc.close();
    }
}