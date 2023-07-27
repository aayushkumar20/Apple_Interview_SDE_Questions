// Serialize and Deserialize Binary Tree
// Link: https://leetcode.com/problems/serialize-and-deserialize-binary-tree/

// Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer,
// or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
// Design an algorithm to serialize and deserialize a binary tree.
// There is no restriction on how your serialization/deserialization algorithm should work.
// You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.
// Clarification: The input/output format is the same as how LeetCode serializes a binary tree.
// You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

// Example 1:
// Input: root = [1,2,3,null,null,4,5]
// Output: [1,2,3,null,null,4,5]

class Codec
{
    func serialize(_ root: TreeNode?) -> String
    {
        var result = [String]()
        var queue = [TreeNode?]()
        
        queue.append(root)
        
        while !queue.isEmpty
        {
            let node = queue.removeFirst()
            
            if node == nil
            {
                result.append("null")
            }
            else
            {
                result.append(String(node!.val))
                queue.append(node!.left)
                queue.append(node!.right)
            }
        }
        
        return result.joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode?
    {
        var data = data.split(separator: ",").map { String($0) }
        var queue = [TreeNode?]()
        var root: TreeNode?
        
        if data[0] == "null"
        {
            return nil
        }
        
        root = TreeNode(Int(data[0])!)
        queue.append(root)
        var i = 1
        
        while !queue.isEmpty
        {
            let node = queue.removeFirst()
            
            if data[i] != "null"
            {
                node?.left = TreeNode(Int(data[i])!)
                queue.append(node?.left)
            }
            
            i += 1
            
            if data[i] != "null"
            {
                node?.right = TreeNode(Int(data[i])!)
                queue.append(node?.right)
            }
            
            i += 1
        }
        
        return root
    }
}