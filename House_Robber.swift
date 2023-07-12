// House Robbers
// https://leetcode.com/problems/house-robber/

// You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
// Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

// Example 1:
// Input: nums = [1,2,3,1]
// Output: 4

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        var dp = [Int]()
        dp.append(nums[0])
        dp.append(max(nums[0], nums[1]))
        for i in 2..<nums.count {
            dp.append(max(dp[i - 1], dp[i - 2] + nums[i]))
        }
        return dp[nums.count - 1]
    }
}