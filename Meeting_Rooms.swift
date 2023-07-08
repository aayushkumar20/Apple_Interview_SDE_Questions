// Meeting Rooms
// https://leetcode.com/problems/meeting-rooms/

// Problem Statement: Given an array of meeting time intervals where intervals[i] = [starti, endi], determine if a person could attend all meetings.

// Example 1:
// Input: intervals = [[0,30],[5,10],[15,20]]
// Output: false

class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        let sortedIntervals = intervals.sorted(by: { $0[0] < $1[0] })
        for i in 0..<sortedIntervals.count - 1 {
            if sortedIntervals[i][1] > sortedIntervals[i + 1][0] {
                return false
            }
        }
        return true
    }
}