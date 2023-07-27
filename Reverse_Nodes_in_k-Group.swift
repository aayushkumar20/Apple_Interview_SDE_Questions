// Reverse Nodes in k-Group
// Link: https://leetcode.com/problems/reverse-nodes-in-k-group/

// Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.
// k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.
// You may not alter the values in the list's nodes, only nodes themselves may be changed.

// Example 1:
// Input: head = [1,2,3,4,5], k = 2
// Output: [2,1,4,3,5]

class Solution
{
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode?
    {
        var head = head
        var count = 0
        var curr = head
        
        while curr != nil && count != k
        {
            curr = curr?.next
            count += 1
        }
        
        if count == k
        {
            curr = reverseKGroup(curr, k)
            
            while count > 0
            {
                let temp = head?.next
                head?.next = curr
                curr = head
                head = temp
                count -= 1
            }
            
            head = curr
        }
        
        return head
    }
}