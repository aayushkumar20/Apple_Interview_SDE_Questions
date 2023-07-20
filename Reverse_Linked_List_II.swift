// Reverse Linked List II
// https://leetcode.com/problems/reverse-linked-list-ii/

// Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

// Input: head = [1,2,3,4,5], left = 2, right = 4
// Output: [1,4,3,2,5]

class Solution
{
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode?
    {
        var head = head
        var left = left
        var right = right
        
        var dummy = ListNode(0)
        dummy.next = head
        var prev = dummy
        
        while left > 1
        {
            prev = prev.next!
            left -= 1
            right -= 1
        }
        
        head = prev.next
        
        while right > 1
        {
            let next = head!.next
            head!.next = next!.next
            next!.next = prev.next
            prev.next = next
            right -= 1
        }
        
        return dummy.next
    }
}