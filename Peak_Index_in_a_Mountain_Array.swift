// Peak Index in a Mountain Array
// https://leetcode.com/problems/peak-index-in-a-mountain-array/

// Let's call an array arr a mountain if the following properties hold:
// arr.length >= 3
// There exists some i with 0 < i < arr.length - 1 such that:
// arr[0] < arr[1] < ... < arr[i - 1] < arr[i] 
// arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
// Given a mountain array arr, return the index i such that arr[0] < arr[1] < ... < arr[i - 1] < arr[i] > arr[i + 1] > ... > arr[arr.length - 1].
// You must solve it in O(log(arr.length)) time complexity.

// Input: arr = [0,1,0]
// Output: 1

class Solution
{
    func peakIndexInMountainArray(_ arr: [Int]) -> Int
    {
        var left = 0
        var right = arr.count - 1
        
        while left < right
        {
            let mid = left + (right - left) / 2
            
            if arr[mid] < arr[mid + 1]
            {
                left = mid + 1
            }
            else
            {
                right = mid
            }
        }
        
        return left
    }
}