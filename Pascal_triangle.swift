// Pascal triangle
// https://leetcode.com/problems/pascals-triangle/

// Given an integer numRows, return the first numRows of Pascal's triangle.
// In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

// Example:
// Input: numRows = 5
// Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

// example 2:
// Input: numRows = 1
// Output: [[1]]

class Solution{
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        for i in 0..<numRows {
            var row = [Int]()
            for j in 0...i {
                if j == 0 || j == i {
                    row.append(1)
                } else {
                    row.append(result[i - 1][j - 1] + result[i - 1][j])
                }
            }
            result.append(row)
        }
        return result
    }
}