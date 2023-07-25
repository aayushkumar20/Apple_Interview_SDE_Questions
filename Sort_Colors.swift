// Sort Colors
// Link: https://leetcode.com/problems/sort-colors/

// Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent,
// with the colors in the order red, white, and blue.
// We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.
// You must solve this problem without using the library's sort function.

// Example 1:
// Input: nums = [2,0,2,1,1,0]
// Output: [0,0,1,1,2,2]

class Solution {
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        
        var left: Int = 0
        var right: Int = nums.count - 1
        var index: Int = 0
        
        while index <= right {
            if nums[index] == 0 {
                nums.swapAt(index, left)
                left += 1
                index += 1
            } else if nums[index] == 2 {
                nums.swapAt(index, right)
                right -= 1
            } else {
                index += 1
            }
        }
    }
}