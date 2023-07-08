// Squares of a Sorted Array
// https://leetcode.com/problems/squares-of-a-sorted-array/

// Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

// Example 1:
// Input: nums = [-4,-1,0,3,10]
// Output: [0,1,9,16,100]

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        // Square all the numbers in the array
        var squaredNums = nums.map { $0 * $0 }
        // Sort the array
        squaredNums.sort()     
        return squaredNums  
    }
    // return the sorted array
    // return squaredNums
}