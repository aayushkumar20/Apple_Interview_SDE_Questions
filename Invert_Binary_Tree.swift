// Invert Binary tree
// https://leetcode.com/problems/invert-binary-tree/

// Given the root of a binary tree, invert the tree, and return its root.

// Example 1:
// Input: root = [4,2,7,1,3,6,9]
// Output: [4,7,2,9,6,3,1]

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil
        {
            return nil
        }
        let left = invertTree(root?.left)
        let right = invertTree(root?.right)
        root?.left = right
        root?.right = left
        return root
    }
}