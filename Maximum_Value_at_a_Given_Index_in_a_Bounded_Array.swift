// Maximum Value at a Given Index in a Bounded Array
// https://leetcode.com/problems/maximum-value-at-a-given-index-in-a-bounded-array/

// You are given three positive integers: n, index, and maxSum. You want to construct an array nums (0-indexed) that satisfies the following conditions:

// nums.length == n
// nums[i] is a positive integer where 0 <= i < n.
// abs(nums[i] - nums[i+1]) <= 1 where 0 <= i < n-1.
// The sum of all the elements of nums does not exceed maxSum.
// nums[index] is maximized.
// Return nums[index] of the constructed array.

// Note that abs(x) equals x if x >= 0, and -x otherwise.

// Example 1:
// Input: n = 4, index = 2,  maxSum = 6
// Output: 2

// Example 2:
// Input: n = 6, index = 1,  maxSum = 10
// Output: 3

class Solution {
    func maxValue(_ n: Int, _ index: Int, _ maxSum: Int) -> Int {
        var (r, l) = (n-index-1, index)
        var (hi, lo, res) = (maxSum, 1, 0)

        while lo <= hi{
            var mid = (hi-lo)/2 + lo
            var (sum, m, ls, rs) = (mid, mid-1, 0, 0)

            rs = r <= m ? m*(m+1)/2 - (m-r)*(m-r+1)/2 : m*(m+1)/2 + 1*(r-m)
            ls = l <= m ? m*(m+1)/2 - (m-l)*(m-l+1)/2 : m*(m+1)/2 + 1*(l-m)

            sum += ls+rs
            sum <= maxSum ? (res = mid, lo = mid+1) : (hi = mid-1, ()) 
        }
        
        return res
    }
}