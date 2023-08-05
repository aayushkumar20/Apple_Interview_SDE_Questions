// Rotate Array
// https://leetcode.com/problems/rotate-array/

// Given an array, rotate the array to the right by k steps, where k is non-negative.

// Example 1:
// Input: nums = [1,2,3,4,5,6,7], k = 3
// Output: [5,6,7,1,2,3,4]

// Example 2:
// Input: nums = [-1,-100,3,99], k = 2
// Output: [3,99,-1,-100]

// Use Two Pointers

class Solution
{
    func rotate(_ nums: inout [Int], _ k: Int)
    {
        let k = k % nums.count
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, k - 1)
        reverse(&nums, k, nums.count - 1)
    }
    
    func reverse(_ nums: inout [Int], _ start: Int, _ end: Int)
    {
        var start = start
        var end = end
        while start < end
        {
            let temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp
            start += 1
            end -= 1
        }
    }
}