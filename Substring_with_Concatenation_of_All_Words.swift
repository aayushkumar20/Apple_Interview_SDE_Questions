// Substring with Concatenation of All Words
// Link: https://leetcode.com/problems/substring-with-concatenation-of-all-words/

// You are given a string s and an array of strings words. All the strings of words are of the same length.

// A concatenated substring in s is a substring that contains all the strings of any permutation of words concatenated.

// For example, if words = ["ab","cd","ef"], then "abcdef", "abefcd", "cdabef", "cdefab", "efabcd", and "efcdab" are all concatenated strings. "acdbef" is not a concatenated substring because it is not the concatenation of any permutation of words.
// Return the starting indices of all the concatenated substrings in s. You can return the answer in any order.

// Example 1:
// Input: s = "barfoothefoobarman", words = ["foo","bar"]
// Output: [0,9]

class Solution
{
    func findSubstring(_ s: String, _ words: [String]) -> [Int]
    {
        var result = [Int]()
        var s = Array(s)
        var words = words
        var map = [String: Int]()
        var wordLen = words[0].count
        var windowLen = wordLen * words.count
        
        for word in words
        {
            map[word] = (map[word] ?? 0) + 1
        }
        
        for i in 0..<wordLen
        {
            var left = i
            var right = i
            var count = 0
            var tempMap = [String: Int]()
            
            while right + wordLen <= s.count
            {
                var word = String(s[right..<right + wordLen])
                
                if map[word] == nil
                {
                    tempMap.removeAll()
                    count = 0
                    left = right + wordLen
                }
                else
                {
                    tempMap[word] = (tempMap[word] ?? 0) + 1
                    count += 1
                    
                    while tempMap[word]! > map[word]!
                    {
                        var leftWord = String(s[left..<left + wordLen])
                        tempMap[leftWord]! -= 1
                        count -= 1
                        left += wordLen
                    }
                    
                    if count == words.count
                    {
                        result.append(left)
                    }
                }
                
                right += wordLen
            }
        }
        
        return result
    }
}