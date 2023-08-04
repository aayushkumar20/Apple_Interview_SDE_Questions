// Longest Common Prefix
// https://leetcode.com/problems/longest-common-prefix/

// Write a function to find the longest common prefix string amongst an array of strings.
// If there is no common prefix, return an empty string "".

// Example 1:
// Input: strs = ["flower","flow","flight"]
// Output: "fl"
// Explanation: The longest common prefix is "fl".

// Example 2:
// Input: strs = ["dog","racecar","car"]
// Output: ""
// Explanation: There is no common prefix among the input strings.

class Solution
{
    func longestCommonPrefix(_ strs: [String]) -> String
    {
        guard strs.count > 0 else { return "" }
        guard strs.count > 1 else { return strs[0] }
        
        var result = ""
        var index = 0
        
        while index < strs[0].count
        {
            let char = strs[0][index]
            
            for i in 1..<strs.count
            {
                if index >= strs[i].count || strs[i][index] != char
                {
                    return result
                }
            }
            
            result.append(char)
            index += 1
        }
        
        return result
    }
}