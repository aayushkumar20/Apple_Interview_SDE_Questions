// Find the Duplicate Number
// https://leetcode.com/problems/find-the-duplicate-number/

// Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.
// There is only one repeated number in nums, return this repeated number.
// You must solve the problem without modifying the array nums and uses only constant extra space.

// Example 1:
// Input: nums = [1,3,4,2,2]
// Output: 2

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        for num in nums {
            if map[num] != nil {
                return num
            } else {
                map[num] = 1
            }
        }       
        return -1
    }
}