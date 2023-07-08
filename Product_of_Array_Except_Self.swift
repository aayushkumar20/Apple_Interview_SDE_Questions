// Product of Array Except Self
// https://leetcode.com/problems/product-of-array-except-self/

// Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
// You must write an algorithm that runs in O(n) time and without using the division operation.

// Example 1:
// Input: nums = [1,2,3,4]
// Output: [24,12,8,6]

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var leftProductArr = [Int]()
        var rightProductArr = [Int]()
        var leftProduct = 1
        var rightProduct = 1
        
        for i in 0 ..< nums.count {
            let leftNum = nums[i]            
            leftProduct *= leftNum            
            leftProductArr.append(leftProduct)
            
            let rightNum = nums[nums.count - 1 - i]
            rightProduct *= rightNum
            rightProductArr.append(rightProduct)
        }
        
        var ret = [Int]()
        
        for i in 0 ..< nums.count {
            let left = (i - 1 >= 0) ? leftProductArr[i - 1] : 1
            let right = (i + 1 < nums.count) ? rightProductArr[(nums.count - 1) - (i + 1)] : 1
            let product = left * right
            ret.append(product)
        }
        
        return ret
    }
}