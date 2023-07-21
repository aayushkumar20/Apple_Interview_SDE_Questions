// Find K Closest Elements
// link: https://leetcode.com/problems/find-k-closest-elements/

// Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order.
// An integer a is closer to x than an integer b if:
// |a - x| < |b - x|, or
// |a - x| == |b - x| and a < b

// Example 1:
// Input: arr = [1,2,3,4,5], k = 4, x = 3
// Output: [1,2,3,4]

class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count - 1
        
        while left + 1 < right {
            let mid = left + (right - left) / 2
            if arr[mid] == x {
                right = mid
            } else if arr[mid] < x {
                left = mid
            } else {
                right = mid
            }
        }
        
        var result = [Int]()
        var count = 0
        while count < k {
            if left < 0 {
                result.append(arr[right])
                right += 1
            } else if right >= arr.count {
                result.append(arr[left])
                left -= 1
            } else {
                if abs(arr[left] - x) <= abs(arr[right] - x) {
                    result.append(arr[left])
                    left -= 1
                } else {
                    result.append(arr[right])
                    right += 1
                }
            }
            count += 1
        }
        
        return result.sorted()
    }
}