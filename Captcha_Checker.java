// Pattern matching Algorithm

// Example 1:
// Input: 
// n = 2
// 112233
// aabbcc
// Output: true

// Example 2:
// Input:
// n = 3
// 111223333
// aaabbbccc
// aabbccdde
// Output: false

// Explanation:
// Uses frequency array to store the frequency of each character in the string.
// Then, we sort the frequency array and check if the frequency of each character is same in both the strings.

// Input Constraints:
// n = is the number of terms for checking the captcha
// s = is the string for checking the captcha (it'll ask for n times)


import java.util.*;

class Captcha_Checker{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        String[] s = new String[n];
        // Taking input for n times
        for(int i=0; i<n; i++){
            s[i] = sc.next();
        }
        // Calling the function
        boolean ans = captchaChecker(s, n);
        System.out.println(ans);
    }
    public static boolean captchaChecker(String[] s, int n){
        // Count array to store the frequency of each character
        int[] count = new int[26];
        // Looping through the string array
        for(int i=0; i<n; i++){
            // Looping through each character of the string
            for(int j=0; j<s[i].length(); j++){
                // Incrementing the count of the character
                count[s[i].charAt(j) - 'a']++;
            }
        }
        // Count array to store the frequency of each character in the string
        // for n number of times
        int[] count1 = new int[26];
        // Looping through the string array
        for(int i=0; i<n; i++){
            // Looping through each character of the string
            for(int j=0; j<s[i].length(); j++){
                // Incrementing the count of the character
                count1[s[i].charAt(j) - 'a']++;
            }
            // Sorting the count array
            Arrays.sort(count);
            // Sorting the count1 array
            Arrays.sort(count1);
            // Looping through the count array
            for(int k=0; k<26; k++){
                // Checking if the frequency of each character is same in both the strings
                if(count[k] != count1[k]){
                    return false;
                }
            }
        }
        return false;
    }
}