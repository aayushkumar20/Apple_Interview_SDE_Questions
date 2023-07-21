// Longest Substring Without Repeating Characters
// Link: https://leetcode.com/problems/longest-substring-without-repeating-characters/

// Given a string s, find the length of the longest substring without repeating characters.

// Example 1:
// Input: s = "abcabcbb"
// Output: 3

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var max = 0
        var start = 0
        var end = 0
        var dict = [Character: Int]()
        for c in s {
            if let index = dict[c] {
                start = max(start, index + 1)
            }
            end += 1
            dict[c] = end - 1
            max = Swift.max(max, end - start)
        }
        return max
    }
}