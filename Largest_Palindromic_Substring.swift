// Largest Palindromic Substring
// Link: https://leetcode.com/problems/longest-palindromic-substring/

// Given a string s, return the longest palindromic substring in s.

// Example 1:
// Input: s = "babad"
// Output: "bab"
// Note: "aba" is also a valid answer.

// Example 2:
// Input: s = "cbbd"
// Output: "bb"

class Solution{
    func longestPalindrome(_ s: String) -> String {
        var start = 0, end = 0
        for i in 0..<s.count {
            let len1 = expandAroundCenter(s, i, i)
            let len2 = expandAroundCenter(s, i, i + 1)
            let len = max(len1, len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: end + 1)
        return String(s[startIndex..<endIndex])
    }
    
    func expandAroundCenter(_ s: String, _ left: Int, _ right: Int) -> Int {
        var left = left, right = right
        while left >= 0 && right < s.count && s[s.index(s.startIndex, offsetBy: left)] == s[s.index(s.startIndex, offsetBy: right)] {
            left -= 1
            right += 1
        }
        return right - left - 1
    }
}