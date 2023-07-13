// Partition to K Equal Sum Subsets
// https://leetcode.com/problems/partition-to-k-equal-sum-subsets/

// Given an integer array nums and an integer k, return true if it is possible to divide this array into k non-empty subsets whose sums are all equal.

// Example 1:
// Input: nums = [4,3,2,3,5,2,1], k = 4
// Output: true

// We can use DP or 2 pointers to solve this problem
// But 2 pointers are time and space consuming
// We can use DP to solve it

class Solution
{
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool
    {
        let sum = nums.reduce(0, +)
        let target = sum/k
        let n = nums.count
        if sum % k != 0
        {
            return false
        }
        var s = [Int](repeating: 0, count: 1<<n)
        for i in 1..<(1<<n)
        {
            s[i] = Int.max
            for j in 0..<n
            {
                if (i & 1 << j) > 0
                {
                    let cur = s[i^1<<j]+nums[j]
                    s[i] = min(s[i], cur==target ? 0 : cur)
                }
            }
        }
        return s[(1<<n)-1]==0
    }
}