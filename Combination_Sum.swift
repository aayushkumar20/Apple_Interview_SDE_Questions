// Combination Sum
// leetcode.com/problems/combination-sum/

// Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.
// The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.
// The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

// Example 1:
// Input: candidates = [2,3,6,7], target = 7
// Output: [[2,2,3], [7]]

// Example 2:
// Input: candidates = [2,3,5], target = 8
// Output: [[2,2,2,2], [2,3,3], [3,5]]

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        combinationSum(candidates.sorted(), target, 0, &current, &result)
        return result
    }
    
    func combinationSum(_ candidates: [Int], _ target: Int, _ start: Int, _ current: inout [Int], _ result: inout [[Int]]) {
        if target == 0 {
            result.append(current)
            return
        }
        
        for i in start..<candidates.count {
            if candidates[i] > target {
                break
            }
            current.append(candidates[i])
            combinationSum(candidates, target - candidates[i], i, &current, &result)
            current.removeLast()
        }
    }
}