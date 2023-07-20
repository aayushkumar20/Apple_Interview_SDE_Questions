// Meeting rooms II
// https://leetcode.com/problems/meeting-rooms-ii/

// Given an array of meeting time intervals intervals where intervals[i] = [starti, endi], return the minimum number of conference rooms required.

// Input: intervals = [[0,30],[5,10],[15,20]]
// Output: 2

class Solution
{
    func minMeetingRooms(_ intervals: [[Int]]) -> Int
    {
        var intervals = intervals
        var start = [Int]()
        var end = [Int]()
        
        for interval in intervals
        {
            start.append(interval[0])
            end.append(interval[1])
        }
        
        start.sort()
        end.sort()
        
        var result = 0
        var endIdx = 0
        
        for i in 0..<start.count
        {
            if start[i] < end[endIdx]
            {
                result += 1
            }
            else
            {
                endIdx += 1
            }
        }
        
        return result
    }
}