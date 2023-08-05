// Unique_Number_Of_Occurences
// Link: https://leetcode.com/problems/unique-number-of-occurrences/

// Given an array of integers arr, write a function that returns true if and only if the number of occurrences of each value in the array is unique.

// Example 1:
// Input: arr = [1,2,2,1,1,3]
// Output: true

// Example 2:
// Input: arr = [1,2]
// Output: false

// Example 3:
// Input: arr = [-3,0,1,-3,1,1,1,-3,10,0]
// Output: true

class Solution{
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var map = [Int: Int]()
        for i in 0..<arr.count {
            if let val = map[arr[i]] {
                map[arr[i]] = val + 1
            } else {
                map[arr[i]] = 1
            }
        }
        var set = Set<Int>()
        for (_, val) in map {
            if set.contains(val) {
                return false
            } else {
                set.insert(val)
            }
        }
        return true
    }
}