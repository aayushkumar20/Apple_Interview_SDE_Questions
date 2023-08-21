// Word Ladder
// Link: https://leetcode.com/problems/word-ladder/

// A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:

// Every adjacent pair of words differs by a single letter.
// Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
// sk == endWord
// Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.

// Example 1:

// Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
// Output: 5
// Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.

// Example 2:

// Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
// Output: 0
// Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.

class Solution{
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordSet = Set<String>(wordList)
        var queue = [String]()
        var visited = Set<String>()
        var level = 0
        queue.append(beginWord)
        visited.insert(beginWord)
        
        while !queue.isEmpty {
            let size = queue.count
            level += 1
            for _ in 0..<size {
                let word = queue.removeFirst()
                if word == endWord {
                    return level
                }
                for i in 0..<word.count {
                    var chars = Array(word)
                    for char in "abcdefghijklmnopqrstuvwxyz" {
                        chars[i] = char
                        let newWord = String(chars)
                        if wordSet.contains(newWord) && !visited.contains(newWord) {
                            queue.append(newWord)
                            visited.insert(newWord)
                        }
                    }
                }
            }
        }
        
        return 0
    }
}