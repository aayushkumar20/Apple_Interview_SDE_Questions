// 3Sum
// Link: https://leetcode.com/problems/3sum/

// Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]]
// such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
// Notice that the solution set must not contain duplicate triplets.

// Example 1:
// Input: nums = [-1,0,1,2,-1,-4]
// Output: [[-1,-1,2],[-1,0,1]]

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
        
        let nums = nums.sorted()
        var result: [[Int]] = []
        
        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            
            var left: Int = i + 1
            var right: Int = nums.count - 1
            
            while left < right {
                let sum: Int = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    result.append([nums[i], nums[left], nums[right]])
                    left += 1
                    right -= 1
                    
                    while left < right && nums[left] == nums[left - 1] {
                        left += 1
                    }
                    
                    while left < right && nums[right] == nums[right + 1] {
                        right -= 1
                    }
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        
        return result       
    }
}