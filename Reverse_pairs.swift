// Reverse pairs
// link: https://leetcode.com/problems/reverse-pairs/

// Given an integer array nums, return the number of reverse pairs in the array.

// A reverse pair is a pair (i, j) where:

// 0 <= i < j < nums.length and
// nums[i] > 2 * nums[j].

// Example 1:

// Input: nums = [1,3,2,3,1]
// Output: 2
// Explanation: The reverse pairs are:
// (1, 4) --> nums[1] = 3, nums[4] = 1, 3 > 2 * 1
// (3, 4) --> nums[3] = 3, nums[4] = 1, 3 > 2 * 1

// Example 2:

// Input: nums = [2,4,3,5,1]
// Output: 3
// Explanation: The reverse pairs are:
// (1, 4) --> nums[1] = 4, nums[4] = 1, 4 > 2 * 1
// (2, 4) --> nums[2] = 3, nums[4] = 1, 3 > 2 * 1
// (3, 4) --> nums[3] = 5, nums[4] = 1, 5 > 2 * 1

class Solution {
    func reversePairs(_ nums: [Int]) -> Int {
        var numsCopy = nums
        return mergeSort(&numsCopy, 0, nums.count - 1)
    }
    
    func mergeSort(_ nums: inout [Int], _ start: Int, _ end: Int) -> Int {
        if start >= end {
            return 0
        }
        
        let mid = start + (end - start) / 2
        var count = mergeSort(&nums, start, mid) + mergeSort(&nums, mid+1, end)
        var j = mid + 1
        
        for i in start...mid {
            while j <= end && nums[i] > 2 * nums[j] {
                j += 1
            }
            count += j - (mid + 1)
        }
        
        var sortedNums = [Int]()
        var left = start
        var right = mid + 1
        
        while left <= mid && right <= end {
            if nums[left] <= nums[right] {
                sortedNums.append(nums[left])
                left += 1
            } else {
                sortedNums.append(nums[right])
                right += 1
            }
        }
        
        while left <= mid {
            sortedNums.append(nums[left])
            left += 1
        }
        
        while right <= end {
            sortedNums.append(nums[right])
            right += 1
        }
        
        for i in start...end {
            nums[i] = sortedNums[i - start]
        }
        
        return count
    }
    
}