// Word Search
// Link: https://leetcode.com/problems/word-search/

// Given an m x n grid of characters board and a string word, return true if word exists in the grid.
// The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

// Example 1:
// Input: board = [["A","B","C","E"],
//                  ["S","F","C","S"],
//                  ["A","D","E","E"]],
//        word = "ABCCED"
// Output: true

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let chs = reverseIfNeeded(Array(word))
        if isValid(board, chs) == false { return false }
        var res = false
        
        func backtrack(_ path: [[Int]], _ position: [Int], _ target: Int) {
            if res || path.count == target { res = true; return }
            
            let char = chs[path.count]
            let positions = next(board, position, char)
            var path = path
            
            for position in positions {
                if path.contains(position) { continue }
                
                path.append(position)
                backtrack(path, position, target)
                path.remove(at: path.count - 1)
            }
        }
        
        backtrack([], [-1, -1], chs.count)
        return res
    }

    
    func isValid(_ board: [[Character]], _ chars: [Character]) -> Bool {
        var res = true
        
        loop1: for c in chars {
            var tmp = false
            
            loop2: for i in 0..<board.count {
                for j in 0..<board[0].count {
                    if board[i][j] == c { tmp = true; break loop2 }
                }
            }
            
            if tmp == false { res = false; break loop1 }
        }
        
        return res
    }

    
    func reverseIfNeeded(_ chars: [Character]) -> [Character] {
        var headCount = 0
        var tailCount = 0
        
        for c in chars {
            if c == chars[0] {
                headCount += 1
            }
            if c == chars[chars.count - 1] {
                tailCount += 1
            }
        }
        
        if tailCount < headCount {
            return chars.reversed()
        
        } else {
            return chars
        }
    }

    
    func next(_ board: [[Character]], _ position: [Int], _ char: Character) -> [[Int]] {
        var res: [[Int]] = []
        
        if position[0] == -1 {
            for i in 0..<board.count {
                for j in 0..<board[0].count {
                    if board[i][j] == char {
                        res.append([i, j])
                    }
                }
            }
        } else {
            var c: Character = " "
            
            if position[0] > 0 {
                let i = position[0] - 1
                let j = position[1]
                c = board[i][j]
                c == char ? res.append([i, j]) : ()
            }
            
            if position[0] < board.count - 1 {
                let i = position[0] + 1
                let j = position[1]
                c = board[i][j]
                c == char ? res.append([i, j]) : ()
            }
            
            if position[1] > 0 {
                let i = position[0]
                let j = position[1] - 1
                c = board[i][j]
                c == char ? res.append([i, j]) : ()
            }
            
            if position[1] < board[0].count - 1 {
                let i = position[0]
                let j = position[1] + 1
                c = board[i][j]
                c == char ? res.append([i, j]) : ()
            }
        }
        
        return res
    }

}