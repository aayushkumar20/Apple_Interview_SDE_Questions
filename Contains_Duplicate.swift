// LeetCode 217 - Contains Duplicate
// url: https://leetcode.com/problems/contains-duplicate/
// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
// Sample input: nums = [1,2,3,1]
// Sample output: true

// Swift Code

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var map = [Int: Int]()
        for num in nums {
            if map[num] != nil {
                return true
            }
            map[num] = 1
        }
        return false
    }
}