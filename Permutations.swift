// Permutations
// Link: https://leetcode.com/problems/permutations/

// Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

// Example 1:
// Input: nums = [1,2,3]
// Output: [[1,2,3],
//          [1,3,2],
//          [2,1,3],
//          [2,3,1],
//          [3,1,2],
//          [3,2,1]]


class Solution
{
    func permute(_ nums: [Int]) -> [[Int]]
    {
        var result = [[Int]]()
        var nums = nums
        permuteHelper(&nums, 0, &result)
        return result
    }
    
    func permuteHelper(_ nums: inout [Int], _ start: Int, _ result: inout [[Int]])
    {
        if start == nums.count
        {
            result.append(nums)
            return
        }
        
        for i in start..<nums.count
        {
            nums.swapAt(start, i)
            permuteHelper(&nums, start + 1, &result)
            nums.swapAt(start, i)
        }
    }
}