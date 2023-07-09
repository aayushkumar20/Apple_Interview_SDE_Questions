// Subsets
// https://leetcode.com/problems/subsets/

// Given an integer array nums of unique elements, return all possible subsets (the power set).
// The solution set must not contain duplicate subsets. Return the solution in any order.

// Example 1:
// Input: nums = [1,2,3]
// Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var temp = [Int]()
        helper(&result, &temp, nums, 0)
        return result
    }
    func helper(_ result: inout [[Int]], _ temp: inout [Int], _ nums: [Int], _ index: Int) {
        result.append(temp)
        for i in index..<nums.count {
            temp.append(nums[i])
            helper(&result, &temp, nums, i + 1)
            temp.removeLast()
        }
    }
}