// Kth Largest Element in an Array
// Link: https://leetcode.com/problems/kth-largest-element-in-an-array/

// Given an integer array nums and an integer k, return the kth largest element in the array.
// Note that it is the kth largest element in the sorted order, not the kth distinct element.
// Can you solve it without sorting?

// Example 1:
// Input: nums = [3,2,1,5,6,4], k = 2
// Output: 5

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        var left = 0
        var right = nums.count - 1
        var target = nums.count - k
        
        while true {
            let index = partition(&nums, left, right)
            if index == target {
                return nums[index]
            } else if index < target {
                left = index + 1
            } else {
                right = index - 1
            }
        }
    }
    func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        var pivot = left
        for i in left..<right {
            if nums[i] <= nums[right] {
                nums.swapAt(i, pivot)
                pivot += 1
            }
        }
        nums.swapAt(pivot, right)
        return pivot
    }
}