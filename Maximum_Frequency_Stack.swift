// Maximum Frequency Stack
// Link: https://leetcode.com/problems/maximum-frequency-stack/

// Design a stack-like data structure to push elements to the stack and pop the most frequent element from the stack.

// Implement the FreqStack class:

// FreqStack() constructs an empty frequency stack.
// void push(int val) pushes an integer val onto the top of the stack.
// int pop() removes and returns the most frequent element in the stack.
// If there is a tie for the most frequent element, the element closest to the stack's top is removed and returned.

// Example 1:
// Input
// ["FreqStack", "push", "push", "push", "push", "push", "push", "pop", "pop", "pop", "pop"],
// [[], [5], [7], [5], [7], [4], [5], [], [], [], []]
// Output
// [null, null, null, null, null, null, null, 5, 7, 5, 4]

class FreqStack
{
    var freqMap = [Int: Int]()
    var groupMap = [Int: [Int]]()
    var maxFreq = 0
    
    init()
    {
        
    }
    
    func push(_ val: Int)
    {
        freqMap[val] = (freqMap[val] ?? 0) + 1
        maxFreq = max(maxFreq, freqMap[val]!)
        
        if groupMap[freqMap[val]!] == nil
        {
            groupMap[freqMap[val]!] = [Int]()
        }
        
        groupMap[freqMap[val]!]!.append(val)
    }
    
    func pop() -> Int
    {
        let val = groupMap[maxFreq]!.removeLast()
        freqMap[val]! -= 1
        
        if groupMap[maxFreq]!.isEmpty
        {
            maxFreq -= 1
        }
        
        return val
    }
}