// Course Schedule II
// Link: https://leetcode.com/problems/course-schedule-ii/

// There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.
// For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
// Return the ordering of courses you should take to finish all courses. If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.

// Example 1:
// Input: numCourses = 2, prerequisites = [[1,0]]
// Output: [0,1]
// Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0. So the correct course order is [0,1].

class Solution
{
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int]
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
        
        var result: [Int] = []
        while !queue.isEmpty
        {
            let course: Int = queue.removeFirst()
            result.append(course)
            
            for nextCourse in graph[course]
            {
                inDegree[nextCourse] -= 1
                if inDegree[nextCourse] == 0
                {
                    queue.append(nextCourse)
                }
            }
        }
        
        return result.count == numCourses ? result : []
    }
}