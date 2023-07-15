// Pacific Atlantic Water Flow
// Link: https://leetcode.com/problems/pacific-atlantic-water-flow/

// There is an m x n rectangular island that borders both the Pacific Ocean and Atlantic Ocean. The Pacific Ocean touches the island's left and top edges, and the Atlantic Ocean touches the island's right and bottom edges.
// The island is partitioned into a grid of square cells. You are given an m x n integer matrix heights where heights[r][c] represents the height above sea level of the cell at coordinate (r, c).
// The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is less than or equal to the current cell's height. Water can flow from any cell adjacent to an ocean into the ocean.
// Return a 2D list of grid coordinates result where result[i] = [ri, ci] denotes that rain water can flow from cell (ri, ci) to both the Pacific and Atlantic oceans.

// Sample Input: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5], [5,1,1,2,4]]
// Sample Output: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]

class Solution
{
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        guard matrix.count > 0 else { return [] }
        let m = matrix.count
        let n = matrix[0].count
        var pacific = Array(repeating: Array(repeating: false, count: n), count: m)
        var atlantic = Array(repeating: Array(repeating: false, count: n), count: m)
        var result = [[Int]]()
        for i in 0..<m {
            dfs(matrix, &pacific, Int.min, i, 0)
            dfs(matrix, &atlantic, Int.min, i, n - 1)
        }
        for j in 0..<n {
            dfs(matrix, &pacific, Int.min, 0, j)
            dfs(matrix, &atlantic, Int.min, m - 1, j)
        }
        for i in 0..<m {
            for j in 0..<n {
                if pacific[i][j] && atlantic[i][j] {
                    result.append([i, j])
                }
            }
        }
        return result
    }
    func dfs(_ matrix: [[Int]], _ visited: inout [[Bool]], _ height: Int, _ x: Int, _ y: Int) {
        let m = matrix.count
        let n = matrix[0].count
        if x < 0 || x >= m || y < 0 || y >= n || visited[x][y] || matrix[x][y] < height {
            return
        }
        visited[x][y] = true
        dfs(matrix, &visited, matrix[x][y], x + 1, y)
        dfs(matrix, &visited, matrix[x][y], x - 1, y)
        dfs(matrix, &visited, matrix[x][y], x, y + 1)
        dfs(matrix, &visited, matrix[x][y], x, y - 1)
    }
}