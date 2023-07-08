// Majority Element
// https://leetcode.com/problems/majority-element/

// Given an array nums of size n, return the majority element.
// The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

// Example 1:
// Input: nums = [3,2,3]
// Output: 3

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for num in nums {
            if let count = dict[num] {
                dict[num] = count + 1
            } else {
                dict[num] = 1
            }
        }
        let sorted = dict.sorted { $0.value > $1.value }
        return sorted[0].key
    }
}