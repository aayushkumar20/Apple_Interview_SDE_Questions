// Odd Even Linked List
// https://leetcode.com/problems/odd-even-linked-list/

// Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.
// The first node is considered odd, and the second node is even, and so on.
// Note that the relative order inside both the even and odd groups should remain as it was in the input.
// You must solve the problem in O(1) extra space complexity and O(n) time complexity.

// Input: head = [1,2,3,4,5]
// Output: [1,3,5,2,4]

class Solution
{
    func oddEvenList(_ head: ListNode?) -> ListNode?
    {
        var head = head
        
        var odd = head
        var even = head?.next
        var evenHead = even
        
        while even != nil && even?.next != nil
        {
            odd?.next = even?.next
            odd = odd?.next
            even?.next = odd?.next
            even = even?.next
        }
        
        odd?.next = evenHead
        
        return head
    }
}