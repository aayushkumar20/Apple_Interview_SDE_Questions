// Partition Equal Subset Sum
// https://leetcode.com/problems/partition-equal-subset-sum/

// Given an integer array nums, return true if you can partition the array into two subsets such that the sum of the elements in both subsets is equal or false otherwise.

// Example 1:
// Input: nums = [1,5,11,5]
// Output: true

class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        var sum = 0
        for num in nums {
            sum += num
        }
        if sum % 2 != 0 {
            return false
        }
        let target = sum / 2
        var dp = Array(repeating: Array(repeating: false, count: target + 1), count: nums.count + 1)
        dp[0][0] = true
        for i in 1...nums.count {
            dp[i][0] = true
        }
        for i in 1...nums.count {
            for j in 1...target {
                if j >= nums[i - 1] {
                    dp[i][j] = dp[i - 1][j] || dp[i - 1][j - nums[i - 1]]
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        return dp[nums.count][target]
    }
}