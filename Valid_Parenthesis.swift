// Valid Parenthesis
// Link: https://leetcode.com/problems/valid-parentheses/

// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

// Example 1:
// Input: s = "()"
// Output: true

// Example 2:
// Input: s = "()[]{}"
// Output: true


class Solution{
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for char in s {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else {
                if stack.isEmpty {
                    return false
                }
                let top = stack.removeLast()
                if char == ")" && top != "(" {
                    return false
                }
                if char == "}" && top != "{" {
                    return false
                }
                if char == "]" && top != "[" {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}