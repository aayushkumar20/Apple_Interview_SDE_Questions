// Last_Day_Where_You_Can_Still_Cross
// Link: https://leetcode.com/discuss/interview-question/406031/

class Solution {
    func latestDayToCross(_ row: Int, _ col: Int, _ cells: [[Int]]) -> Int {
        var left = 0
        var right = cells.count - 1
        var result = 0
        while left <= right {
            let mid = left + (right - left) / 2
            if canCross(row, col, cells, mid) {
                result = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
    
    func canCross(_ row: Int, _ col: Int, _ cells: [[Int]], _ day: Int) -> Bool {
        var grid: [[Int]] = Array(repeating: Array(repeating: 0, count: col), count: row)
        for i in 0..<day {
            grid[cells[i][0] - 1][cells[i][1] - 1] = 1
        }
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: col), count: row)
        for i in 0..<col {
            if grid[0][i] == 0 {
                dfs(0, i, &grid, &visited)
            }
        }
        for i in 0..<col {
            if visited[row - 1][i] {
                return true
            }
        }
        return false
    }
    
    func dfs(_ x: Int, _ y: Int, _ grid: inout [[Int]], _ visited: inout [[Bool]]) {
        if x < 0 || x >= grid.count || y < 0 || y >= grid[0].count || visited[x][y] || grid[x][y] == 1 {
            return
        }
        visited[x][y] = true
        dfs(x + 1, y, &grid, &visited)
        dfs(x - 1, y, &grid, &visited)
        dfs(x, y + 1, &grid, &visited)
        dfs(x, y - 1, &grid, &visited)
    }
}