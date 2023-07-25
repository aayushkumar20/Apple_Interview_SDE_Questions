// Validate Binary Search Tree
// Link: https://leetcode.com/problems/validate-binary-search-tree/

// Given the root of a binary tree, determine if it is a valid binary search tree (BST).
// A valid BST is defined as follows:
// The left subtree of a node contains only nodes with keys less than the node's key.
// The right subtree of a node contains only nodes with keys greater than the node's key.
// Both the left and right subtrees must also be binary search trees.

// Example 1:
// Input: root = [2,1,3]
// Output: true

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
// Validate Binary Search Tree
// https://leetcode.com/problems/validate-binary-search-tree/


class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, nil, nil)
    }
    
    func isValidBST(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let root = root else { return true }
        if let min = min, root.val <= min { return false }
        if let max = max, root.val >= max { return false }
        return isValidBST(root.left, min, root.val) && isValidBST(root.right, root.val, max)
    }
}