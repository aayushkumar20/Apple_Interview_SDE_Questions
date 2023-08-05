// Valid_Parenthesis_String
// https://leetcode.com/problems/valid-parenthesis-string/


// Given a string s containing only three types of characters: '(', ')' and '*', return true if s is valid.
// The following rules define a valid string:
//     Any left parenthesis '(' must have a corresponding right parenthesis ')'.
//     Any right parenthesis ')' must have a corresponding left parenthesis '('.
//     Left parenthesis '(' must go before the corresponding right parenthesis ')'.
//     '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string "".
// Example 1:
// Input: s = "()"
// Output: true
// Example 2:
// Input: s = "(*)"
// Output: true
// Example 3:
// Input: s = "(*))"
// Output: true


class Solution{
    func checkValidString(_ s: String) -> Bool {
        var stack = [Int]()
        var star = [Int]()
        var s = Array(s)
        for i in 0..<s.count {
            if s[i] == "(" {
                stack.append(i)
            } else if s[i] == "*" {
                star.append(i)
            } else {
                if stack.count > 0 {
                    stack.removeLast()
                } else if star.count > 0 {
                    star.removeLast()
                } else {
                    return false
                }
            }
        }
        while stack.count > 0 {
            if star.count == 0 {
                return false
            } else if stack.last! < star.last! {
                stack.removeLast()
                star.removeLast()
            } else {
                return false
            }
        }
        return true
    }
}