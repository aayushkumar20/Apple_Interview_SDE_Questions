// Sliding Window Maximum
// Link: https://leetcode.com/problems/sliding-window-maximum/

// You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right.
// You can only see the k numbers in the window. Each time the sliding window moves right by one position.
// Return the max sliding window.

// Example 1:
// Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
// Output: [3,3,5,5,6,7]
// Explanation:
// Window position                Max
// ---------------               -----
// [1  3  -1] -3  5  3  6  7       3
//  1 [3  -1  -3] 5  3  6  7       3
//  1  3 [-1  -3  5] 3  6  7       5
//  1  3  -1 [-3  5  3] 6  7       5
//  1  3  -1  -3 [5  3  6] 7       6
//  1  3  -1  -3  5 [3  6  7]      7


class Solution
{
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int]
    {
        var result = [Int]()
        var deque = [Int]()
        
        for i in 0..<nums.count
        {
            while !deque.isEmpty && nums[deque.last!] < nums[i]
            {
                deque.removeLast()
            }
            
            deque.append(i)
            
            if i >= k - 1
            {
                result.append(nums[deque.first!])
                
                if deque.first! == i - k + 1
                {
                    deque.removeFirst()
                }
            }
        }
        
        return result
    }
}