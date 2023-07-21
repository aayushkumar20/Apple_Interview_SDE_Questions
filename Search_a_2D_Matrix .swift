// Search a 2D Matrix
// Link: https://leetcode.com/problems/search-a-2d-matrix/

// You are given an m x n integer matrix matrix with the following two properties:
// Each row is sorted in non-decreasing order.
// The first integer of each row is greater than the last integer of the previous row.
// Given an integer target, return true if target is in matrix or false otherwise.
// You must write a solution in O(log(m * n)) time complexity.

// Example 1:
// Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
// Output: true

// Using DP

class Solution
{
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool
    {
        let m = matrix.count
        let n = matrix[0].count
        
        var dp = Array(repeating: Array(repeating: false, count: n), count: m)
        
        for i in 0..<m
        {
            for j in 0..<n
            {
                if matrix[i][j] == target
                {
                    return true
                }
                
                if matrix[i][j] < target
                {
                    dp[i][j] = true
                }
            }
        }
        
        return false
    }
}