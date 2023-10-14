// Subsets
// https://leetcode.com/problems/subsets/

// Given an integer array nums of unique elements, return all possible subsets (the power set).

// The solution set must not contain duplicate subsets. Return the solution in any order.

// Example 1:
// Input: nums = [1,2,3]
// Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

// Example 2:
// Input: nums = [0]
// Output: [[],[0]]

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var temp = [Int]()
        dfs(nums, 0, &temp, &result)
        return result
    }
    
    func dfs(_ nums: [Int], _ index: Int, _ temp: inout [Int], _ result: inout [[Int]]) {
        result.append(temp)
        for i in index..<nums.count {
            temp.append(nums[i])
            dfs(nums, i + 1, &temp, &result)
            temp.removeLast()
        }
    }
}