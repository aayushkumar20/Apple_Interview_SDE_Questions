// Biggest_Single_Number
// Link: https://leetcode.com/problems/biggest-single-number/

// Given an array nums, return the biggest value in the array which is also a single number.

// Example 1:
// Input: nums = [1,2,3,4,3,2,1]
// Output: 4

// Example 2:
// Input: nums = [1,1,2,2]
// Output: -1

class Solution
{
    func biggestSingleNumber(_ nums: [Int]) -> Int
    {
        var map = [Int: Int]()
        for i in 0..<nums.count
        {
            if let val = map[nums[i]]
            {
                map[nums[i]] = val + 1
            }
            else
            {
                map[nums[i]] = 1
            }
        }
        var max = Int.min
        for (key, val) in map
        {
            if val == 1 && key > max
            {
                max = key
            }
        }
        return max == Int.min ? -1 : max
    }
}