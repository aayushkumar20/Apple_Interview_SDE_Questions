// Maximum Subarray
// https://leetcode.com/problems/maximum-subarray/

// Given an integer array nums, find the subarray with the largest sum, and return its sum.

// Example 1:
// Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
// Output: 6

class Solution
{
    func maxSubArray(_ nums: [Int]) -> Int
    {
        var maxSum = nums[0]
        var currentSum = nums[0]
        
        for i in 1..<nums.count
        {
            currentSum = max(nums[i], currentSum + nums[i])
            maxSum = max(maxSum, currentSum)
        }
        
        return maxSum
    }
}