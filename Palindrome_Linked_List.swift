// Palindrome Linked List
// https://leetcode.com/problems/palindrome-linked-list/

// Given the head of a singly linked list, return true if it is a palindrome or false otherwise.

// Example 1:
// Input: head = [1,2,2,1]
// Output: true

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var ref = head
        var map = [Int]()
        while ref != nil {
            map.append(ref!.val)
            ref = ref!.next
        }
        ref = head
        for i in (0..<map.count).reversed() {
            if ref!.val != map[i] {
                return false
            }
            ref = ref!.next
        }
        return true
    }
}