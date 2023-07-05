// Single Number
// https://leetcode.com/problems/single-number/
// Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
// You must implement a solution with a linear runtime complexity and use only constant extra space.
// Input: nums = [2,2,1]
// Output: 1

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for num in nums {
            if let _ = dict[num] {
                dict.removeValue(forKey: num)
            } else {
                dict[num] = 1
            }
        }
        return dict.first!.key
    }
}