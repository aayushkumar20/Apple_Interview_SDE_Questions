// Design Circular Queue
// Leetcode: https://leetcode.com/problems/design-circular-queue/

// Design your implementation of the circular queue. The circular queue is a linear data structure in which the operations are performed based on FIFO (First In First Out) principle, and the last position is connected back to the first position to make a circle. It is also called "Ring Buffer".

// One of the benefits of the circular queue is that we can make use of the spaces in front of the queue. In a normal queue, once the queue becomes full, we cannot insert the next element even if there is a space in front of the queue. But using the circular queue, we can use the space to store new values.

// Implement the MyCircularQueue class:

// MyCircularQueue(k) Initializes the object with the size of the queue to be k.
// int Front() Gets the front item from the queue. If the queue is empty, return -1.
// int Rear() Gets the last item from the queue. If the queue is empty, return -1.
// boolean enQueue(int value) Inserts an element into the circular queue. Return true if the operation is successful.
// boolean deQueue() Deletes an element from the circular queue. Return true if the operation is successful.
// boolean isEmpty() Checks whether the circular queue is empty or not.
// boolean isFull() Checks whether the circular queue is full or not.
// You must solve the problem without using the built-in queue data structure in your programming language. 

// Example 1:
// Input:
// ["MyCircularQueue", "enQueue", "enQueue", "enQueue", "enQueue", "Rear", "isFull", "deQueue", "enQueue", "Rear"]
// [[3], [1], [2], [3], [4], [], [], [], [4], []]
// Output:
// [null, true, true, true, false, 3, true, true, true, 4]

// Design Circular Queue
// https://leetcode.com/explore/learn/card/queue-stack/228/first-in-first-out-data-structure/1337/

class MyCircularQueue {
    var queue: [Int]
    var head: Int
    var tail: Int
    var size: Int
    var count: Int

    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        queue = [Int](repeating: 0, count: k)
        head = 0
        tail = 0
        size = k
        count = 0
    }
    
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        queue[tail] = value
        tail = (tail + 1) % size
        count += 1
        return true
    }
    
    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        if isEmpty() {
            return false
        }
        head = (head + 1) % size
        count -= 1
        return true
    }
    
    /** Get the front item from the queue. */
    func Front() -> Int {
        if isEmpty() {
            return -1
        }
        return queue[head]
    }
    
    /** Get the last item from the queue. */
    func Rear() -> Int {
        if isEmpty() {
            return -1
        }
        return queue[(tail - 1 + size) % size]
    }
    
    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
        return count == 0
    }
    
    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        return count == size
    }
}