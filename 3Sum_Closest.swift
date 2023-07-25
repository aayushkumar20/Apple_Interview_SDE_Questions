// 3Sum Closest
// Link: https://leetcode.com/problems/3sum-closest/

// Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.
// Return the sum of the three integers.
// You may assume that each input would have exactly one solution.

// Example 1:
// Input: nums = [-1,2,1,-4], target = 1
// Output: 2

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count >= 3 else { return 0 }
        
        let nums = nums.sorted()
        var result: Int = nums[0] + nums[1] + nums[2]
        
        for i in 0..<nums.count {
            var left: Int = i + 1
            var right: Int = nums.count - 1
            
            while left < right {
                let sum: Int = nums[i] + nums[left] + nums[right]
                if sum == target {
                    return sum
                }
                
                if abs(sum - target) < abs(result - target) {
                    result = sum
                }
                
                if sum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        
        return result
    }
}