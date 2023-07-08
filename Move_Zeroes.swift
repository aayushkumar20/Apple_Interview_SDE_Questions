// Move Zeroes
// https://leetcode.com/problems/move-zeroes/

// Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
// Note that you must do this in-place without making a copy of the array.

// Example 1:
// Input: nums = [0,1,0,3,12]
// Output: [1,3,12,0,0]

class Solution
{
    func moveZeroes(_ nums: inout [Int])
    {
        var i = 0
        var j = 0
        while i < nums.count
        {
            if nums[i] != 0
            {
                nums[j] = nums[i]
                j += 1
            }
            i += 1
        }
        while j < nums.count
        {
            nums[j] = 0
            j += 1
        }
    }
}