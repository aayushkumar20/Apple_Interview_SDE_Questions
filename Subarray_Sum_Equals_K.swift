// Subarray_Sum_Equals_K
// Link: https://leetcode.com/problems/subarray-sum-equals-k/

// Given an array of integers nums and an integer k, return the total number of continuous subarrays whose sum equals to k.

// Example 1:
// Input: nums = [1,1,1], k = 2
// Output: 2

// Example 2:
// Input: nums = [1,2,3], k = 3
// Output: 2

class Solution{
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var sum = 0
        var map = [Int: Int]()
        map[0] = 1
        for i in 0..<nums.count {
            sum += nums[i]
            if let val = map[sum - k] {
                count += val
            }
            if let val = map[sum] {
                map[sum] = val + 1
            } else {
                map[sum] = 1
            }
        }
        return count
    }
}