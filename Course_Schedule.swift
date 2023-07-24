// Course Schedule
// Link: https://leetcode.com/problems/course-schedule/

// There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.
// For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
// Return true if you can finish all courses. Otherwise, return false.

// Example 1:
// Input: numCourses = 2, prerequisites = [[1,0]]
// Output: true
// Explanation: There are a total of 2 courses to take. 
// To take course 1 you should have finished course 0. So it is possible.

class Solution
{
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool
    {
        var graph: [[Int]] = Array(repeating: [], count: numCourses)
        var inDegree: [Int] = Array(repeating: 0, count: numCourses)
        
        for prerequisite in prerequisites
        {
            let course: Int = prerequisite[0]
            let prerequisiteCourse: Int = prerequisite[1]
            
            graph[prerequisiteCourse].append(course)
            inDegree[course] += 1
        }
        
        var queue: [Int] = []
        for i in 0..<numCourses
        {
            if inDegree[i] == 0
            {
                queue.append(i)
            }
        }
        
        var count: Int = 0
        while !queue.isEmpty
        {
            let course: Int = queue.removeFirst()
            count += 1
            
            for nextCourse in graph[course]
            {
                inDegree[nextCourse] -= 1
                if inDegree[nextCourse] == 0
                {
                    queue.append(nextCourse)
                }
            }
        }
        
        return count == numCourses
    }
}