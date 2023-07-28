// Trapping Rain Water
// Link: https://leetcode.com/problems/trapping-rain-water/

// Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

// Example 1:
// Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
// Output: 6


class Solution {
    func trap(_ height: [Int]) -> Int {
        var leftMax = Array(repeating: 0, count: height.count)
        var rightMax = Array(repeating: 0, count: height.count)
        
        var max = 0
        for i in 0..<height.count {
            if height[i] > max {
                max = height[i]
            }
            leftMax[i] = max
        }
        
        max = 0
        for i in stride(from: height.count - 1, through: 0, by: -1) {
            if height[i] > max {
                max = height[i]
            }
            rightMax[i] = max
        }
        
        var output = 0
        for i in 0..<height.count {
            output += min(leftMax[i], rightMax[i]) - height[i]
        }
        
        return output
    }
}