// Kth Largest Element in a Stream
// Link: https://leetcode.com/problems/kth-largest-element-in-a-stream/

// Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.

// Implement KthLargest class:

// KthLargest(int k, int[] nums) Initializes the object with the integer k and the stream of integers nums.
// int add(int val) Appends the integer val to the stream and returns the element representing the kth largest element in the stream.

// Sample Input:
// ["KthLargest", "add", "add", "add", "add", "add"]
// [[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]
// Sample Output:
// [null, 4, 5, 5, 8, 8]

class KthLargest {
    var k: Int
    var heap: [Int]
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.heap = []
        for v in nums{
            heap.append(v)
            if heap.count > k {
                heap.sort()
                heap.removeFirst()
            }
        }
    }
    
    func add(_ val: Int) -> Int {
        heap.append(val)
        if heap.count > k {
            heap.sort()
            heap.removeFirst()
        }
        return heap[0]
    }
}