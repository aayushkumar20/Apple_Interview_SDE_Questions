// Minimum Size Subarray Sum
// Link: https://leetcode.com/problems/minimum-size-subarray-sum/

// Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

// Example 1:
// Input: target = 7, nums = [2,3,1,2,4,3]
// Output: 2

class Solution
{
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int
    {
        var left = 0
        var right = 0
        var sum = 0
        var result = Int.max
        
        while right < nums.count
        {
            sum += nums[right]
            while sum >= target
            {
                result = min(result, right - left + 1)
                sum -= nums[left]
                left += 1
            }
            right += 1
        }
        
        return result == Int.max ? 0 : result
    }
}