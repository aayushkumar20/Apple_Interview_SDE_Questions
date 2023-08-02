// Count Sorted Vovel String
// Leetcode: https://leetcode.com/problems/count-sorted-vowel-strings/

// Given an integer n, return the number of strings of length n that consist only of vowels (a, e, i, o, u) and are lexicographically sorted.

// A string s is lexicographically sorted if for all valid i, s[i] is the same as or comes before s[i+1] in the alphabet.

// Example 1:
// Input: n = 1
// Output: 5

// Example 2:
// Input: n = 2
// Output: 15

class Solution
{
    func countVowelStrings(_ n: Int) -> Int
    {
        var dp = [Int](repeating: 1, count: 5)
        for _ in 1..<n
        {
            for i in 1..<5
            {
                dp[i] += dp[i - 1]
            }
        }
        return dp.reduce(0, +)
    }
}