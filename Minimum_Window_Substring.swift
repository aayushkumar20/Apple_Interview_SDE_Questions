// Minimum Window Substring
// Link: https://leetcode.com/problems/minimum-window-substring/

// Given two strings s and t of lengths m and n respectively, return the minimum window
// substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".
// The testcases will be generated such that the answer is unique.

// Example 1:
// Input: s = "ADOBECODEBANC", t = "ABC"
// Output: "BANC"

// Minimum window substring
// https://leetcode.com/problems/minimum-window-substring/

class Solution
{
    func minWindow(_ s: String, _ t: String) -> String
    {
        var s = Array(s)
        var t = Array(t)
        var map = [Character: Int]()
        var count = t.count
        var start = 0
        var end = 0
        var minStart = 0
        var minLen = Int.max
        
        for c in t
        {
            map[c] = (map[c] ?? 0) + 1
        }
        
        while end < s.count
        {
            if map[s[end]] != nil
            {
                map[s[end]]! -= 1
                if map[s[end]]! >= 0
                {
                    count -= 1
                }
            }
            
            end += 1
            
            while count == 0
            {
                if end - start < minLen
                {
                    minStart = start
                    minLen = end - start
                }
                
                if map[s[start]] != nil
                {
                    map[s[start]]! += 1
                    if map[s[start]]! > 0
                    {
                        count += 1
                    }
                }
                
                start += 1
            }
        }
        
        if minLen != Int.max
        {
            return String(s[minStart..<minStart + minLen])
        }
        
        return ""
    }
}