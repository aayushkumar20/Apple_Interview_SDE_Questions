// Longest Increasing Subsequence
// https://leetcode.com/problems/longest-increasing-subsequence/

// Given an integer array nums, return the length of the longest strictly increasing subsequence.

// Example 1:
// Input: nums = [10,9,2,5,3,7,101,18]
// Output: 4

class Solution
{
    func lengthOfLIS(_ nums: [Int]) -> Int
    {
        var dp = [Int](repeating: 1, count: nums.count)
        var max = 1
        
        for i in 1..<nums.count
        {
            for j in 0..<i
            {
                if nums[i] > nums[j] && dp[i] < dp[j] + 1
                {
                    dp[i] = dp[j] + 1
                }
            }
            
            if max < dp[i]
            {
                max = dp[i]
            }
        }
        
        return max
    }
}