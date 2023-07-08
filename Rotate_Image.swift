// Rotate Image
// https://leetcode.com/problems/rotate-image/

// You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
// You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

// Example 1:
// Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
// Output: [[7,4,1],[8,5,2],[9,6,3]]

class Solution
{
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<n {
            for j in i..<n {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
        
        for i in 0..<n {
            for j in 0..<n/2 {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[i][n-1-j]
                matrix[i][n-1-j] = temp
            }
        }
    }
}