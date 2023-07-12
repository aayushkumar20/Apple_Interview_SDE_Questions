// Word Break
// https://leetcode.com/problems/word-break/

// Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.
// Note that the same word in the dictionary may be reused multiple times in the segmentation.

// Example 1:
// Input: s = "leetcode", wordDict = ["leet","code"]
// Output: true
// Explanation: Return true because "leetcode" can be segmented as "leet code".

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        for i in 1...s.count {
            for j in 0..<i {
                if dp[j] && wordDict.contains(String(s[s.index(s.startIndex, offsetBy: j)..<s.index(s.startIndex, offsetBy: i)])) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[s.count]
    }
}