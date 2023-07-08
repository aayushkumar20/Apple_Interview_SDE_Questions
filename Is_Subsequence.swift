// Is Subsequence
// https://leetcode.com/problems/is-subsequence/

// Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
// A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

// Example 1:
// Input: s = "abc", t = "ahbgdc"
// Output: true

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var s = Array(s)
        var t = Array(t)
        var i = 0
        var j = 0
        while i < s.count && j < t.count {
            if s[i] == t[j] {
                i += 1
            }
            j += 1
        }
        return i == s.count       
    }
}