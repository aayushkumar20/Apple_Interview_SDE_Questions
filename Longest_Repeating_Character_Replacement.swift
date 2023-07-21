// Longest Repeating Character Replacement
// Link: https://leetcode.com/problems/longest-repeating-character-replacement/

// You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.
// Return the length of the longest substring containing the same letter you can get after performing the above operations.

// Example 1:
// Input: s = "ABAB", k = 2
// Output: 4

class Solution
{
    func characterReplacement(_ s: String, _ k: Int) -> Int
    {
        var left = 0
        var right = 0
        var result = 0
        var maxCount = 0
        var map = [Character: Int]()
        
        let s = Array(s)
        
        while right < s.count
        {
            map[s[right], default: 0] += 1
            maxCount = max(maxCount, map[s[right]]!)
            
            while right - left + 1 - maxCount > k
            {
                map[s[left]]! -= 1
                left += 1
            }
            
            result = max(result, right - left + 1)
            right += 1
        }
        
        return result
    }
}