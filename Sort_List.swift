// Sort List
// https://leetcode.com/problems/sort-list/

// Given the head of a linked list, return the list after sorting it in ascending order.

// Sample Input: head = [4,2,1,3]
// Sample Output: [1,2,3,4]

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var array = [Int]()
        var node = head
        while node.next != nil {
            array.append(node.val)
            node = node.next!
        }
        array.append(node.val)
        array.sort()
        let newHead = ListNode(array[0])
        var newNode = newHead
        for i in 1..<array.count {
            newNode.next = ListNode(array[i])
            newNode = newNode.next!
        }
        return newHead
    }
}