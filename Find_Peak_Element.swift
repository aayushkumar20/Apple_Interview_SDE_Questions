// Find Peak Element
// https://leetcode.com/problems/find-peak-element/

// A peak element is an element that is strictly greater than its neighbors.
// Given an integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.
// You may imagine that nums[-1] = nums[n] = -∞.
// You must write an algorithm that runs in O(log n) time.

// Input: nums = [1,2,3,1]
// Output: 2

class Solution
{
    func findPeakElement(_ nums: [Int]) -> Int
    {
        var left = 0
        var right = nums.count - 1
        
        while left < right
        {
            let mid = left + (right - left) / 2
            
            if nums[mid] < nums[mid + 1]
            {
                left = mid + 1
            }
            else
            {
                right = mid
            }
        }
        
        return left
    }
}