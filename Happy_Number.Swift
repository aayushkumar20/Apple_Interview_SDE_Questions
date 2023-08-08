// Happy Number
// Link: https://leetcode.com/problems/happy-number/

// Write an algorithm to determine if a number n is happy.

// A happy number is a number defined by the following process:

// Starting with any positive integer, replace the number by the sum of the squares of its digits.
// Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
// Those numbers for which this process ends in 1 are happy.
// Return true if n is a happy number, and false if not.

// Example 1:
// Input: n = 19
// Output: true

// Example 2:
// Input: n = 2
// Output: false

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var set = Set<Int>()
        var num = n
        
        while num != 1 {
            var sum = 0
            while num > 0 {
                let digit = num % 10
                sum += digit * digit
                num /= 10
            }
            
            if set.contains(sum) {
                return false
            }
            
            set.insert(sum)
            num = sum
        }
        
        return true
    }
}