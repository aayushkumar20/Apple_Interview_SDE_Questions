// Longest Valid Parenthesis
// https://leetcode.com/problems/longest-valid-parentheses/

// Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

// Example 1:
// Input: s = "(()"
// Output: 2
// Explanation: The longest valid parentheses substring is "()".

// Example 2:
// Input: s = ")()())"
// Output: 4
// Explanation: The longest valid parentheses substring is "()()".

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var max = 0
        var stack = [Int]()
        stack.append(-1)
        for (i, c) in s.enumerated() {
            if c == "(" {
                stack.append(i)
            } else {
                stack.popLast()
                if stack.isEmpty {
                    stack.append(i)
                } else {
                    max = Swift.max(max, i - stack.last!)
                }
            }
        }
        return max
    }
}