// Lowest Common Ancestor of a Binary Search Tree
// Link: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

// Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.
// According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

// Example 1:
// Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
// Output: 6


/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }
        
        if p.val < root.val && q.val < root.val {
            return lowestCommonAncestor(root.left, p, q)
        }
        
        if p.val > root.val && q.val > root.val {
            return lowestCommonAncestor(root.right, p, q)
        }
        
        return root       
    }
}