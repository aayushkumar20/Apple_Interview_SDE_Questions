// Binary Search
// https://leetcode.com/problems/binary-search/

// Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
// You must write an algorithm with O(log n) runtime complexity.

// Example 1:
// Input: nums = [-1,0,3,5,9,12], target = 9
// Output: 4

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1, mid = 0
        while left <= right {
            mid = (left + right) / 2
            if nums[mid] == target {
                return mid
            }
            if nums[mid] >= nums[left] {
                if target >= nums[left] && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if target <= nums[right] && target > nums[mid] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1       
    }
}