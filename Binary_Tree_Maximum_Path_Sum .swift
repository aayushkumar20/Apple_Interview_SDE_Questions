// Binary Tree Maximum Path Sum
// Link: https://leetcode.com/problems/binary-tree-maximum-path-sum/

// A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root.
// The path sum of a path is the sum of the node's values in the path.
// Given the root of a binary tree, return the maximum path sum of any non-empty path.

// Example 1:
// Input: root = [1,2,3]
// Output: 6


class Solution
{
    var maxSum = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int
    {
        maxPathSumHelper(root)
        return maxSum
    }

    func maxPathSumHelper(_ root: TreeNode?) -> Int
    {
        guard let root = root else { return 0 }

        let left = max(0, maxPathSumHelper(root.left))
        let right = max(0, maxPathSumHelper(root.right))

        maxSum = max(maxSum, left + right + root.val)

        return max(left, right) + root.val
    }
}