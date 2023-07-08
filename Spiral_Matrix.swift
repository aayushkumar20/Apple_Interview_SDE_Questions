// Spiral Matrix
// https://leetcode.com/problems/spiral-matrix/

// Given an m x n matrix, return all elements of the matrix in spiral order.

// Example 1:
// Input: matrix = [[1,2,3],
//                  [4,5,6],
//                  [7,8,9]]
// Output: [1,2,3,6,9,8,7,4,5]

class Solution {
    public func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        if matrix.count == 0 {
            return result
        }
        let m = matrix.count
        let n = matrix[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        var i = 0
        var j = 0
        var count = 0
        while count < m * n {
            while j < n && dp[i][j] == 0 {
                result.append(matrix[i][j])
                dp[i][j] = 1
                count += 1
                j += 1
            }
            j -= 1
            i += 1
            while i < m && dp[i][j] == 0 {
                result.append(matrix[i][j])
                dp[i][j] = 1
                count += 1
                i += 1
            }
            i -= 1
            j -= 1
            while j >= 0 && dp[i][j] == 0 {
                result.append(matrix[i][j])
                dp[i][j] = 1
                count += 1
                j -= 1
            }
            j += 1
            i -= 1
            while i >= 0 && dp[i][j] == 0 {
                result.append(matrix[i][j])
                dp[i][j] = 1
                count += 1
                i -= 1
            }
            i += 1
            j += 1
        }
        return result
    }
}