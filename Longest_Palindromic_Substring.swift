// Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring/

// Given a string s, return the longest palindromic substring in s.

// Example 1:
// Input: s = "babad"
// Output: "bab"
// Note: "aba" is also a valid answer.

class Solution {
    private var lo = 0
    private var maxLen = 0
    
    func longestPalindrome(_ s: String) -> String {
        let len = s.count
        if len < 2 {
            return s
        }
        
        for i in 0..<len-1 {
            extendPalindrome(s, i, i)
            extendPalindrome(s, i, i+1)
        }
        let start = s.index(s.startIndex, offsetBy: lo)
        let end = s.index(s.startIndex, offsetBy: lo + maxLen)
        return String(s[start..<end])
    }
    
    private func extendPalindrome(_ s: String, _ j: Int, _ k: Int) {
        var j = j
        var k = k
        let s = Array(s)
        while j >= 0 && k < s.count && s[j] == s[k] {
            j -= 1
            k += 1
        }
        if maxLen < k - j - 1 {
            lo = j + 1
            maxLen = k - j - 1
        }
    }
}