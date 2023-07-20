// Insert Interval
// https://leetcode.com/problems/insert-interval/

// You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.
// Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).
// Return intervals after the insertion.

// Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
// Output: [[1,5],[6,9]]

class Solution
{
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]]
    {
        var intervals = intervals
        var newInterval = newInterval
        
        var i = 0
        
        while i < intervals.count && intervals[i][1] < newInterval[0]
        {
            i += 1
        }
        
        while i < intervals.count && intervals[i][0] <= newInterval[1]
        {
            newInterval[0] = min(newInterval[0], intervals[i][0])
            newInterval[1] = max(newInterval[1], intervals[i][1])
            intervals.remove(at: i)
        }
        
        intervals.insert(newInterval, at: i)
        
        return intervals
    }
}