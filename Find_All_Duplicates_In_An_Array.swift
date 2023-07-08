// Find All Duplicates in an Array
// https://leetcode.com/problems/find-all-duplicates-in-an-array/

// Given an integer array nums of length n where all the integers of nums are in the range [1, n] and each integer appears once or twice, return an array of all the integers that appears twice.
// You must write an algorithm that runs in O(n) time and uses only constant extra space.

// Example 1:
// Input: nums = [4,3,2,7,8,2,3,1]
// Output: [2,3]

class Solution
{
    func findDuplicates(_ nums: [Int]) -> [Int]
    {
        var nums = nums
        var result = [Int]()
        for i in 0..<nums.count
        {
            let index = abs(nums[i]) - 1
            if nums[index] < 0
            {
                result.append(abs(nums[i]))
            }
            else
            {
                nums[index] = -nums[index]
            }
        }
        return result
    }
}