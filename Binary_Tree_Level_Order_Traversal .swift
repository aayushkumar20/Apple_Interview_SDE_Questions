// Binary Tree Level Order Traversal
// Link: https://leetcode.com/problems/binary-tree-level-order-traversal/

// Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

// Example 1:
// Input: root = [3,9,20,null,null,15,7]
// Output: [[3],[9,20],[15,7]]

class Solution
{
    func levelOrder(_ root: TreeNode?) -> [[Int]]
    {
        guard let root = root else { return [] }
        
        var result: [[Int]] = []
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty
        {
            var level: [Int] = []
            for _ in 0..<queue.count
            {
                let node: TreeNode = queue.removeFirst()
                level.append(node.val)
                
                if let left = node.left
                {
                    queue.append(left)
                }
                
                if let right = node.right
                {
                    queue.append(right)
                }
            }
            
            result.append(level)
        }
        
        return result
    }
}