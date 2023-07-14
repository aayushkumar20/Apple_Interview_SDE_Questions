// Reorder List
// https://leetcode.com/problems/reorder-list/

// You are given the head of a singly linked-list. The list can be represented as:
// L0 → L1 → … → Ln - 1 → Ln
// Reorder the list to be on the following form:
// L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
// You may not modify the values in the list's nodes. Only nodes themselves may be changed.

class Solution {
    func reorderList(_ head: ListNode?) {
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        var prev: ListNode? = nil
        var curr = slow
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        var first = head
        var second = prev
        while second?.next != nil {
            let firstNext = first?.next
            let secondNext = second?.next
            first?.next = second
            second?.next = firstNext
            first = firstNext
            second = secondNext
        }
    }
}