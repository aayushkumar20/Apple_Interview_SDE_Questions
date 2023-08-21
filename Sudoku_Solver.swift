// Sudoku Solver
// Link: https://leetcode.com/problems/sudoku-solver/

// Write a program to solve a Sudoku puzzle by filling the empty cells.

// A sudoku solution must satisfy all of the following rules:

// Each of the digits 1-9 must occur exactly once in each row.
// Each of the digits 1-9 must occur exactly once in each column.
// Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
// The '.' character indicates empty cells.

// Sample Input:
// [["5","3",".",".","7",".",".",".","."],
//  ["6",".",".","1","9","5",".",".","."],
//  [".","9","8",".",".",".",".","6","."],
//  ["8",".",".",".","6",".",".",".","3"],
//  ["4",".",".","8",".","3",".",".","1"],
//  ["7",".",".",".","2",".",".",".","6"],
//  [".","6",".",".",".",".","2","8","."],
//  [".",".",".","4","1","9",".",".","5"],
//  [".",".",".",".","8",".",".","7","9"]]
// Sample Output:
// [["5","3","4","6","7","8","9","1","2"],
//  ["6","7","2","1","9","5","3","4","8"],
//  ["1","9","8","3","4","2","5","6","7"],
//  ["8","5","9","7","6","1","4","2","3"],
//  ["4","2","6","8","5","3","7","9","1"],
//  ["7","1","3","9","2","4","8","5","6"],
//  ["9","6","1","5","3","7","2","8","4"],
//  ["2","8","7","4","1","9","6","3","5"],
//  ["3","4","5","2","8","6","1","7","9"]]

class Solution{
    func solveSudoku(_ board: inout [[Character]]) {
        var rows = Array(repeating: Set<Character>(), count: 9)
        var cols = Array(repeating: Set<Character>(), count: 9)
        var boxes = Array(repeating: Set<Character>(), count: 9)
        for i in 0..<9{
            for j in 0..<9{
                if board[i][j] != "."{
                    rows[i].insert(board[i][j])
                    cols[j].insert(board[i][j])
                    boxes[(i/3)*3 + j/3].insert(board[i][j])
                }
            }
        }
        dfs(&board, &rows, &cols, &boxes, 0, 0)
    }
    
    func dfs(_ board: inout [[Character]], _ rows: inout [Set<Character>], _ cols: inout [Set<Character>], _ boxes: inout [Set<Character>], _ i: Int, _ j: Int) -> Bool{
        if i == 9{
            return true
        }
        if j == 9{
            return dfs(&board, &rows, &cols, &boxes, i+1, 0)
        }
        if board[i][j] != "."{
            return dfs(&board, &rows, &cols, &boxes, i, j+1)
        }
        for c in "123456789"{
            if rows[i].contains(c) || cols[j].contains(c) || boxes[(i/3)*3 + j/3].contains(c){
                continue
            }
            board[i][j] = c
            rows[i].insert(c)
            cols[j].insert(c)
            boxes[(i/3)*3 + j/3].insert(c)
            if dfs(&board, &rows, &cols, &boxes, i, j+1){
                return true
            }
            board[i][j] = "."
            rows[i].remove(c)
            cols[j].remove(c)
            boxes[(i/3)*3 + j/3].remove(c)
        }
        return false
    }
}