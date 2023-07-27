// First Missing Positive
// Link: https://leetcode.com/problems/first-missing-positive/

// Given an unsorted integer array nums, return the smallest missing positive integer.
// You must implement an algorithm that runs in O(n) time and uses O(1) auxiliary space.

// Example 1:
// Input: nums = [1,2,0]
// Output: 3

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        var i = 0
        
        while i < nums.count {
            if nums[i] > 0 && nums[i] <= nums.count && nums[i] != nums[nums[i] - 1] {
                nums.swapAt(i, nums[i] - 1)
            } else {
                i += 1
            }
        }
        
        for i in 0..<nums.count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        
        return nums.count + 1
    }
}