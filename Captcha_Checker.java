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

class Captcha_Checker {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        String[] s = new String[n];
        for (int i = 0; i < n; i++) {
            s[i] = sc.next();
        }
        for (int i = 0; i < n; i++) {
            System.out.println(checkCaptcha(s[i]));
        }
    }

    static boolean checkCaptcha(String s) {
        int[] freq = new int[26];
        for (int i = 0; i < s.length(); i++) {
            freq[s.charAt(i) - 'a']++;
        }
        Arrays.sort(freq);
        for (int i = 0; i < 25; i++) {  // Corrected loop condition
            if (freq[i] != freq[i + 1]) {
                return false;
            }
        }
        return true;
    }
}
