// Top K Frequent Elements
// Link: https://leetcode.com/problems/top-k-frequent-elements/

// Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

// Example 1:
// Input: nums = [1,1,1,2,2,3], k = 2
// Output: [1,2]

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for num in nums {
            dict[num, default: 0] += 1
        }
        var heap = Heap<(Int, Int)>(sort: { $0.1 < $1.1 })
        for (key, value) in dict {
            heap.insert((key, value))
            if heap.count > k {
                heap.remove()
            }
        }
        return heap.map { $0.0 }
    }
}