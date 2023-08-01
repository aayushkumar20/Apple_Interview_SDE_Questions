// Integer to English Words
// Link to problem: https://leetcode.com/problems/integer-to-english-words/

// Convert a non-negative integer num to its English words representation.

// Example 1:
// Input: num = 123
// Output: "One Hundred Twenty Three"

// Example 2:
// Input: num = 12345
// Output: "Twelve Thousand Three Hundred Forty Five"

class Solution {
    func numberToWords(_ num: Int) -> String {
        if num == 0 {
            return "Zero"
        }
        var num = num
        var res = ""
        var i = 0
        while num > 0 {
            if num % 1000 != 0 {
                res = helper(num % 1000) + thousands[i] + " " + res
            }
            num /= 1000
            i += 1
        }
        return res.trimmingCharacters(in: .whitespaces)
    }
    
    func helper(_ num: Int) -> String {
        if num == 0 {
            return ""
        } else if num < 20 {
            return lessThan20[num] + " "
        } else if num < 100 {
            return tens[num / 10] + " " + helper(num % 10)
        } else {
            return lessThan20[num / 100] + " Hundred " + helper(num % 100)
        }
    }
    
    let lessThan20 = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
                      "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen",
                      "Seventeen", "Eighteen", "Nineteen"]
    let tens = ["", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy",
                "Eighty", "Ninety"]
    let thousands = ["", "Thousand", "Million", "Billion"]
}