// Equal_Row_and_Columns_Pairs
// Link: https://leetcode.com/problems/equal-row-and-column-pairs/

// Given a 0-indexed n x n integer matrix grid, return the number of pairs (ri, cj) such that row ri and column cj are equal.
// A row and column pair is considered equal if they contain the same elements in the same order (i.e., an equal array).

// Example 1:
// Input: grid = [[1,2,3],
//                [3,2,1],
//                [2,1,3]]
// Output: 3

// Example 2:
// Input: grid = [[1,1,1],
//                [1,1,1],
//                [1,1,1]]
// Output: 9

class Solution {
    func equalPairs(_ grid: [[Int]]) -> Int {
        var col = [String: Int]()
        for i in 0..<grid[0].count {
            var sb = ""
            for j in 0..<grid.count {
                sb += "\(grid[j][i]),"
            }
            col[sb, default: 0] += 1
        }
        var res = 0
        for i in 0..<grid.count {
            var sb = ""
            for j in 0..<grid[0].count {
                sb += "\(grid[i][j]),"
            }
            if let val = col[sb] {
                res += val
            }
        }
        return res
    }
}