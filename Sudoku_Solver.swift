// Sudoku Solver
// Link: https://leetcode.com/problems/sudoku-solver/

// Write a program to solve a Sudoku puzzle by filling the empty cells.
// A sudoku solution must satisfy all of the following rules:
// Each of the digits 1-9 must occur exactly once in each row.
// Each of the digits 1-9 must occur exactly once in each column.
// Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
// The '.' character indicates empty cells.

// Example 1:
// Input: board = [["5","3",".",".","7",".",".",".","."],
//                 ["6",".",".","1","9","5",".",".","."],
//                 [".","9","8",".",".",".",".","6","."],
//                 ["8",".",".",".","6",".",".",".","3"],
//                 ["4",".",".","8",".","3",".",".","1"],
//                 ["7",".",".",".","2",".",".",".","6"],
//                 [".","6",".",".",".",".","2","8","."],
//                 [".",".",".","4","1","9",".",".","5"],
//                 [".",".",".",".","8",".",".","7","9"]]
// Output: board = [["5","3","4","6","7","8","9","1","2"],
//                  ["6","7","2","1","9","5","3","4","8"],
//                  ["1","9","8","3","4","2","5","6","7"],
//                  ["8","5","9","7","6","1","4","2","3"],
//                  ["4","2","6","8","5","3","7","9","1"],
//                  ["7","1","3","9","2","4","8","5","6"],
//                  ["9","6","1","5","3","7","2","8","4"],
//                  ["2","8","7","4","1","9","6","3","5"],
//                  ["3","4","5","2","8","6","1","7","9"]]
// Explanation: The input board is shown above and the only valid solution is shown below:


class Solution
{
    func solveSudoku(_ board: inout [[Character]])
    {
        solve(&board)
    }
    
    func solve(_ board: inout [[Character]]) -> Bool
    {
        for i in 0..<board.count
        {
            for j in 0..<board[0].count
            {
                if board[i][j] == "."
                {
                    for c in 1...9
                    {
                        if isValid(board, i, j, Character("\(c)"))
                        {
                            board[i][j] = Character("\(c)")
                            
                            if solve(&board)
                            {
                                return true
                            }
                            else
                            {
                                board[i][j] = "."
                            }
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    func isValid(_ board: [[Character]], _ row: Int, _ col: Int, _ c: Character) -> Bool
    {
        for i in 0..<9
        {
            if board[i][col] != "." && board[i][col] == c
            {
                return false
            }
            if board[row][i] != "." && board[row][i] == c
            {
                return false
            }
            if board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] != "." && board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] == c
            {
                return false
            }
        }
        return true
    }
}