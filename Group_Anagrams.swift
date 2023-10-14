// Group_Anagrams
// Link: https://leetcode.com/problems/group-anagrams/

// Given an array of strings strs, group the anagrams together. You can return the answer in any order.

// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

// Example 1:
// Input: strs = ["eat","tea","tan","ate","nat","bat"]
// Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

// Example 2:
// Input: strs = [""]
// Output: [[""]]

// Example 3:
// Input: strs = ["a"]
// Output: [["a"]]

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result: [[String]] = []
        var map: [String: [String]] = [:]
        for str in strs {
            let sortedStr = String(str.sorted())
            if map[sortedStr] == nil {
                map[sortedStr] = [str]
            } else {
                map[sortedStr]?.append(str)
            }
        }
        for (_, value) in map {
            result.append(value)
        }
        return result
    }
}