// Climbing Stairs
// https://leetcode.com/problems/climbing-stairs/
// You are climbing a staircase. It takes n steps to reach the top.
// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
// Example 1:
// Input: n = 2
// Output: 2
// Explanation: There are two ways to climb to the top.
// 1. 1 step + 1 step
// 2. 2 steps

class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        var a = 1
        var b = 2
        var c = 0
        for _ in 3...n {
            c = a + b
            a = b
            b = c
        }
        return c
    }
}