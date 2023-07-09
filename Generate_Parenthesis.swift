// Generate Parentheses
// https://leetcode.com/problems/generate-parentheses/

// Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

// For example, given n = 3, a solution set is:
// [ "((()))", "(()())", "(())()", "()(())", "()()()" ]

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        generateParenthesisHelper(n, n, "", &result)
        return result
    }
    
    func generateParenthesisHelper(_ left: Int, _ right: Int, _ current: String, _ result: inout [String]) {
        if left == 0 && right == 0 {
            result.append(current)
            return
        }
        
        if left > 0 {
            generateParenthesisHelper(left - 1, right, current + "(", &result)
        }
        
        if right > left {
            generateParenthesisHelper(left, right - 1, current + ")", &result)
        }
    }
}