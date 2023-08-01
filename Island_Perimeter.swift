// Island Perimeter
// https://leetcode.com/problems/island-perimeter/

// You are given row x col grid representing a map where grid[i][j] = 1 represents land and grid[i][j] = 0 represents water.
// Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).
// The island doesn't have "lakes", meaning the water inside isn't connected to the water around the island. One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

// Example 1:
// Input: grid = [[0,1,0,0],
//                [1,1,1,0],
//                [0,1,0,0],
//                [1,1,0,0]]
// Output: 16

// Example 2:
// Input: grid = [[1]]
// Output: 4

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var perimeter = 0
        var grid = grid
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 1 {
                    perimeter += 4
                    if i > 0 && grid[i-1][j] == 1 {
                        perimeter -= 2
                    }
                    if j > 0 && grid[i][j-1] == 1 {
                        perimeter -= 2
                    }
                }
            }
        }
        return perimeter
    }
}