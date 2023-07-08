// Merge Two Sorted Lists
// https://leetcode.com/problems/merge-two-sorted-lists/

// You are given the heads of two sorted linked lists list1 and list2.
// Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.
// Return the head of the merged linked list.

// Example 1:
// Input: list1 = [1,2,4], list2 = [1,3,4]
// Output: [1,1,2,3,4,4]

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1 = list1
        var list2 = list2
        let dummy = ListNode(0)
        var current: ListNode? = dummy
        while list1 != nil && list2 != nil {
            if list1!.val < list2!.val {
                current?.next = list1
                list1 = list1?.next
            } else {
                current?.next = list2
                list2 = list2?.next
            }
            current = current?.next
        }
        current?.next = list1 ?? list2
        return dummy.next       
    }
}