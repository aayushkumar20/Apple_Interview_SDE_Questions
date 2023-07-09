// Letter Combinations of a Phone Number
// https://leetcode.com/problems/letter-combinations-of-a-phone-number/

// Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

// Example 1:
// Input: digits = "23"
// Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

class Solution
{
    func letterCombinations(_ digits: String) -> [String]
    {
        if digits.count == 0
        {
            return []
        }
        
        let map: [Character: [Character]] = ["2": ["a", "b", "c"],
                                            "3": ["d", "e", "f"],
                                            "4": ["g", "h", "i"],
                                            "5": ["j", "k", "l"],
                                            "6": ["m", "n", "o"],
                                            "7": ["p", "q", "r", "s"],
                                            "8": ["t", "u", "v"],
                                            "9": ["w", "x", "y", "z"]]
        
        var result: [String] = []
        var current: [Character] = []
        
        func backtrack(_ index: Int)
        {
            if index == digits.count
            {
                result.append(String(current))
                return
            }
            
            let digit = digits[digits.index(digits.startIndex, offsetBy: index)]
            let letters = map[digit]!
            
            for letter in letters
            {
                current.append(letter)
                backtrack(index + 1)
                current.removeLast()
            }
        }
        
        backtrack(0)
        
        return result
    }
}