// Longest Subarray of 1's After Deleting One Element
// Link: https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element/


// Given a binary array nums, you should delete one element from it.
// Return the size of the longest non-empty subarray containing only 1's in the resulting array. Return 0 if there is no such subarray.

// Example 1:
// Input: nums = [1,1,0,1]
// Output: 3

class Solution
{
    func longestSubarray(_ nums: [Int]) -> Int
    {
        let n = nums.count
        var left = 0
        var zeros = 0
        var ans = 0

        for right in 0..<n
        {
            if nums[right] == 0
            {
                zeros += 1
            }
            while zeros > 1
            {
                if nums[left] == 0
                {
                    zeros -= 1
                }
                left += 1
            }
            ans = max(ans, right - left + 1 - zeros)
        }
        return (ans == n) ? ans - 1 : ans
    }
}