// Add two numbers
// https://leetcode.com/problems/add-two-numbers/

// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.

// Example 1:
// Input: l1 = [2,4,3], l2 = [5,6,4]
// Output: [7,0,8]

class Solution
{
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?
    {
        var l1 = l1
        var l2 = l2
        var carry = 0
        let dummy = ListNode(0)
        var current = dummy
        
        while l1 != nil || l2 != nil
        {
            let x = l1?.val ?? 0
            let y = l2?.val ?? 0
            let sum = x + y + carry
            carry = sum / 10
            current.next = ListNode(sum % 10)
            current = current.next!
            if l1 != nil { l1 = l1?.next }
            if l2 != nil { l2 = l2?.next }
        }
        
        if carry > 0
        {
            current.next = ListNode(carry)
        }
        
        return dummy.next
    }
}