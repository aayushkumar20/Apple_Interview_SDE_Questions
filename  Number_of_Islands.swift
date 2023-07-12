// Number of Islands
// Link: https://leetcode.com/problems/number-of-islands/

// Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
// An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

// Example 1:
// Input: grid = [
//   ["1","1","1","1","0"],
//   ["1","1","0","1","0"],
//   ["1","1","0","0","0"],
//   ["0","0","0","0","0"]
// ]
// Output: 1

class Solution
{
    func numIslands(_ grid: [[Character]]) -> Int
    {
        var grid = grid
        var count = 0
        for i in 0..<grid.count
        {
            for j in 0..<grid[i].count
            {
                if grid[i][j] == "1"
                {
                    count += 1
                    dfs(&grid, i, j)
                }
            }
        }
        return count
    }
    
    func dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int)
    {
        if i < 0 || i >= grid.count || j < 0 || j >= grid[i].count || grid[i][j] == "0"
        {
            return
        }
        grid[i][j] = "0"
        dfs(&grid, i + 1, j)
        dfs(&grid, i - 1, j)
        dfs(&grid, i, j + 1)
        dfs(&grid, i, j - 1)
    }
}