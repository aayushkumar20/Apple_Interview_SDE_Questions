// Longest Consecutive Sequence
// https://leetcode.com/problems/longest-consecutive-sequence/

// Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
// You must write an algorithm that runs in O(n) time.

// Example 1:

// Input: nums = [100,4,200,1,3,2]
// Output: 4
// Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

class Solution{
    func longestConsecutive(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        var longestStreak = 0
        var currentStreak = 0
        for i in 0..<sortedNums.count {
            if i == 0 || sortedNums[i] != sortedNums[i - 1] {
                currentStreak = 1
            } else if sortedNums[i] != sortedNums[i - 1] {
                currentStreak += 1
            }
            longestStreak = max(longestStreak, currentStreak)
        }   
    }
    return longestStreak
}