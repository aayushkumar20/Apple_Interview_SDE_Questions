// Remove Linked List Elements
// https://leetcode.com/problems/remove-linked-list-elements/

// Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, and return the new head.

// Example 1:
// Input: head = [1,2,6,3,4,5,6], val = 6
// Output: [1,2,3,4,5]

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var prev = dummy
        while prev.next != nil {
            if prev.next!.val == val {
                prev.next = prev.next!.next
            } else {
                prev = prev.next!
            }
        }
        return dummy.next
    }
}