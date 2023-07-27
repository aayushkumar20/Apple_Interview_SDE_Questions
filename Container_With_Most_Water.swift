// Container With Most Water
// Link: https://leetcode.com/problems/container-with-most-water/

// You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
// Find two lines that together with the x-axis form a container, such that the container contains the most water.
// Return the maximum amount of water a container can store.
// Notice that you may not slant the container.

// Example 1:
// Input: height = [1,8,6,2,5,4,8,3,7]
// Output: 49

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left: Int = 0
        var right: Int = height.count - 1
        var maxArea: Int = 0
        
        while left < right {
            let area: Int = min(height[left], height[right]) * (right - left)
            maxArea = max(maxArea, area)
            
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea       
    }
}