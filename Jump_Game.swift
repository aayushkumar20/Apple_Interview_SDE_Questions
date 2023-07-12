// Jump Game
// https://leetcode.com/problems/jump-game/

// You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.
// Return true if you can reach the last index, or false otherwise.

// Example 1:
// Input: nums = [2,3,1,1,4]
// Output: true

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var maxReach = 0
        for i in 0..<nums.count {
            if i > maxReach {
                return false
            }
            maxReach = max(maxReach, i + nums[i])
        }
        return true
    }
}