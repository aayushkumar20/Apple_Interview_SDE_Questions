// Merge k Sorted Lists
// Link: https://leetcode.com/problems/merge-k-sorted-lists/

// You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
// Merge all the linked-lists into one sorted linked-list and return it.

// Example 1:
// Input: lists = [[1,4,5],[1,3,4],[2,6]]
// Output: [1,1,2,3,4,4,5,6]

class Solution
{
    func mergeKLists(_ lists: [ListNode?]) -> ListNode?
    {
        var lists = lists
        var interval = 1
        
        while interval < lists.count
        {
            for i in stride(from: 0, to: lists.count - interval, by: interval * 2)
            {
                lists[i] = mergeTwoLists(lists[i], lists[i + interval])
            }
            
            interval *= 2
        }
        
        return lists.first ?? nil
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?
    {
        var l1 = l1
        var l2 = l2
        let dummy = ListNode(0)
        var curr = dummy
        
        while l1 != nil && l2 != nil
        {
            if l1!.val < l2!.val
            {
                curr.next = l1
                l1 = l1?.next
            }
            else
            {
                curr.next = l2
                l2 = l2?.next
            }
            
            curr = curr.next!
        }
        
        curr.next = l1 ?? l2
        
        return dummy.next
    }
}