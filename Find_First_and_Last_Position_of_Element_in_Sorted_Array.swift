// Find_First_and_Last_Position_of_Element_in_Sorted_Array
// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/

// Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

// If target is not found in the array, return [-1, -1].

// You must write an algorithm with O(log n) runtime complexity.

// Example 1:
// Input: nums = [5,7,7,8,8,10], target = 8
// Output: [3,4]

// Example 2:
// Input: nums = [5,7,7,8,8,10], target = 6
// Output: [-1,-1]

// Example 3:
// Input: nums = [], target = 0
// Output: [-1,-1]

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [-1, -1]
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target {
                result[0] = mid
                right = mid - 1
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        left = 0
        right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target {
                result[1] = mid
                left = mid + 1
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
}