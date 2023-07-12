// Maximum Product Subarray
// https://leetcode.com/problems/maximum-product-subarray/

// Given an integer array nums, find a subarray that has the largest product, and return the product.
// The test cases are generated so that the answer will fit in a 32-bit integer.

// Example 1:
// Input: nums = [2,3,-2,4]
// Output: 6

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maxProduct = nums[0]
        var minProduct = nums[0]
        var result = nums[0]
        for i in 1..<nums.count {
            let temp = maxProduct
            maxProduct = max(max(maxProduct * nums[i], minProduct * nums[i]), nums[i])
            minProduct = min(min(temp * nums[i], minProduct * nums[i]), nums[i])
            result = max(maxProduct, result)
        }
        return result
    }
}