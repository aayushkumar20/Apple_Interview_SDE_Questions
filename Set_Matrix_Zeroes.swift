// Set Matrix Zeroes
// https://leetcode.com/problems/set-matrix-zeroes/

// Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.
// You must do it in place.

// Example 1:
// Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
// Output: [[1,0,1],[0,0,0],[1,0,1]]

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var row = false
        var col = false
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] == 0 {
                    if i == 0 {
                        row = true
                    }
                    if j == 0 {
                        col = true
                    }
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        
        for i in 1..<matrix.count {
            for j in 1..<matrix[0].count {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                } 
            }
        }
        
        if row {
            for i in 0..<matrix[0].count {
                matrix[0][i] = 0
            }
        }
        
        if col {
            for i in 0..<matrix.count {
                matrix[i][0] = 0
            }
        }       
    }
}