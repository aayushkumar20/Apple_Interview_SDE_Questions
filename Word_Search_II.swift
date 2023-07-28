// Word Search II
// Link: https://leetcode.com/problems/word-search-ii/

// Given an m x n board of characters and a list of strings words, return all words on the board.
// Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

// Example 1:
// Input: board = [["o","a","a","n"],
//                 ["e","t","a","e"],
//                 ["i","h","k","r"],
//                 ["i","f","l","v"]], words = ["oath","pea","eat","rain"]
// Output: ["eat","oath"]

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        
        // 1. make Trie
        class Node {
            var isEnd: Bool
            var word: String
            var nextChars: [Character: Node]
            init() {
                self.isEnd = false
                self.word = ""
                self.nextChars = [:]
            }
        }
        var headNode = Node()
        for word in words {
            var currentHead = headNode
            for char in word {
                if currentHead.nextChars[char] == nil {
                    let node = Node()
                    currentHead.nextChars[char] = node
                }
                currentHead = currentHead.nextChars[char]!
            }
            currentHead.isEnd = true
            currentHead.word = word
        }
        
        // 2. DFS
        let diffX = [0,0,-1,1]
        let diffY = [1,-1,0,0]
        var output = Set<String>()
        
        func dfs(_ node: Node, _ row: Int, _ col: Int, _ visited: inout [[Bool]]) {
            guard node.nextChars[board[row][col]] != nil else { return }
            var nextNode = node.nextChars[board[row][col]]!
            if nextNode.isEnd { output.insert(nextNode.word) }
            visited[row][col] = true
            for direction in 0..<4 {
                let nextRow = row + diffY[direction]
                let nextCol = col + diffX[direction]
                guard isValidCell(nextRow, nextCol, board) else { continue }
                guard !visited[nextRow][nextCol] else { continue }
                dfs(nextNode, nextRow, nextCol, &visited)
            }
            visited[row][col] = false
            return
        }
    
    
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                var visited = Array(repeating: Array(repeating: false, count: board.first!.count), count: board.count)
                dfs(headNode, row, col, &visited)
            }
        }
        return Array(output)
    }
    
    func isValidCell(_ row: Int, _ col: Int, _ board: [[Character]]) -> Bool {
        return row >= 0 && row < board.count && col >= 0 && col < board.first!.count
    }
}