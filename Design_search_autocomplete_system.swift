// Design search autocomplete system
// https://leetcode.com/problems/design-search-autocomplete-system/

// Design a search autocomplete system for a search engine. Users may input a sentence (at least one word and end with a special character '#'). For each character they type except '#', you need to return the top 3 historical hot sentences that have prefix the same as the part of sentence already typed. Here are the specific rules:
// The hot degree for a sentence is defined as the number of times a user typed the exactly same sentence before.
// The returned top 3 hot sentences should be sorted by hot degree (The first is the hottest one). If several sentences have the same degree of hot, you need to use ASCII-code order (smaller one appears first).
// If less than 3 hot sentences exist, then just return as many as you can.
// When the input is a special character, it means the sentence ends, and in this case, you need to return an empty list.
// Your job is to implement the following functions:
// The constructor function:
// AutocompleteSystem(String[] sentences, int[] times): This is the constructor. The input is historical data. Sentences is a string array consists of previously typed sentences. Times is the corresponding times a sentence has been typed. Your system should record these historical data.
// Now, the user wants to input a new sentence. The following function will provide the next character the user types:
// List<String> input(char c): The input c is the next character typed by the user. The character will only be lower-case letters ('a' to 'z'), blank space (' ') or a special character ('#'). Also, the previously typed sentence should be recorded in your system. The output will be the top 3 historical hot sentences that have prefix the same as the part of sentence already typed.

// Example:
// Operation: AutocompleteSystem(["i love you", "island","ironman", "i love leetcode"], [5,3,2,2])
// The system have already tracked down the following sentences and their corresponding times:
// "i love you" : 5 times
// "island" : 3 times
// "ironman" : 2 times
// "i love leetcode" : 2 times
// Now, the user begins another search:
// Operation: input('i')
// Output: ["i love you", "island","i love leetcode"]
// Explanation:
// There are four sentences that have prefix "i". Among them, "ironman" and "i love leetcode" have same hot degree. Since ' ' has ASCII code 32 and 'r' has ASCII code 114, "i love leetcode" should be in front of "ironman". Also we only need to output top 3 hot sentences, so "ironman" will be ignored.
// Operation: input(' ')
// Output: ["i love you","i love leetcode"]
// Explanation:
// There are only two sentences that have prefix "i ".
// Operation: input('a')
// Output: []
// Explanation:
// There are no sentences that have prefix "i a".
// Operation: input('#')
// Output: []
// Explanation:
// The user finished the input, the sentence "i a" should be saved as a historical sentence in system. And the following input will be counted as a new search.


class AutocompleteSystem {
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
    var currentHead = Node()
    var currentInput = ""
    init(_ sentences: [String], _ times: [Int]) {
        for i in 0..<sentences.count {
            var currentHead = headNode
            for char in sentences[i] {
                if currentHead.nextChars[char] == nil {
                    let node = Node()
                    currentHead.nextChars[char] = node
                }
                currentHead = currentHead.nextChars[char]!
            }
            currentHead.isEnd = true
            currentHead.word = sentences[i]
        }
    }
    
    func input(_ c: Character) -> [String] {
        if c == "#" {
            currentHead.isEnd = true
            currentHead.word = currentInput
            currentInput = ""
            currentHead = headNode
            return []
        }
        currentInput += String(c)
        if currentHead.nextChars[c] == nil {
            let node = Node()
            currentHead.nextChars[c] = node
        }
        currentHead = currentHead.nextChars[c]!
        var output = [String]()
        var heap = Heap<(String, Int)>(sort: { $0.1 > $1.1 })
        dfs(currentHead, &heap)
        while !heap.isEmpty && output.count < 3 {
            output.append(heap.remove()!.0)
        }
        return output
    }
    
    func dfs(_ node: Node, _ heap: inout Heap<(String, Int)>) {
        if node.isEnd {
            heap.insert((node.word, 1))
        }
        for (_, nextNode) in node.nextChars {
            dfs(nextNode, &heap)
        }
    }
}