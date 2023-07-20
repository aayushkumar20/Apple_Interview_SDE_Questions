// Merge Intervals
// https://leetcode.com/problems/merge-intervals/

// Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

// Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
// Output: [[1,6],[8,10],[15,18]]

class Solution
{
    func merge(_ intervals: [[Int]]) -> [[Int]]
    {
        var intervals = intervals
        var result = [[Int]]()
        
        intervals.sort { $0[0] < $1[0] }
        
        for interval in intervals
        {
            if result.isEmpty || result.last![1] < interval[0]
            {
                result.append(interval)
            }
            else
            {
                result[result.count - 1][1] = max(result.last![1], interval[1])
            }
        }
        
        return result
    }
}