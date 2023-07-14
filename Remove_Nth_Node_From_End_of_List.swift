// Remove Nth Node From End of List
// LeeCode: https://leetcode.com/problems/remove-nth-node-from-end-of-list/

// Given the head of a linked list, remove the nth node from the end of the list and return its head.

// Example 1:
// Input: head = [1,2,3,4,5], n = 2
// Output: [1,2,3,5]

class Solution
{
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode?
    {
        var dummy = ListNode(0)
        dummy.next = head
        var slow: ListNode? = dummy
        var fast: ListNode? = dummy
        
        for _ in 0..<n
        {
            fast = fast?.next
        }
        
        while fast?.next != nil
        {
            slow = slow?.next
            fast = fast?.next
        }
        
        slow?.next = slow?.next?.next
        
        return dummy.next
    }
}