// Median of Two Sorted Arrays
// Link: https://leetcode.com/problems/median-of-two-sorted-arrays/

// Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
// Follow up: The overall run time complexity should be O(log (m+n)).

// Example 1:
// Input: nums1 = [1,3], nums2 = [2]
// Output: 2.00000

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let total = nums1.count + nums2.count
        let mid = total / 2
        var i = 0
        var j = 0
        var k = 0
        var nums = [Int]()
        while i < nums1.count && j < nums2.count {
            if nums1[i] < nums2[j] {
                nums.append(nums1[i])
                i += 1
            } else {
                nums.append(nums2[j])
                j += 1
            }
            k += 1
        }
        while i < nums1.count {
            nums.append(nums1[i])
            i += 1
            k += 1
        }
        while j < nums2.count {
            nums.append(nums2[j])
            j += 1
            k += 1
        }
        if total % 2 == 0 {
            return Double(nums[mid - 1] + nums[mid]) / 2.0
        } else {
            return Double(nums[mid])
        }
    }
}