// All Nodes Distance K in Binary Tree
// Link: https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/

// Given the root of a binary tree, the value of a target node target, and an integer k, return an array of the values of all nodes that have a distance k from the target node.
// You can return the answer in any order.

// Example 1:
// Input: root = [3,5,1,6,2,0,8,null,null,7,4], target = 5, k = 2
// Output: [7,4,1]

class Solution {
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard let root = root, let target = target else { return [] }
        
        var graph: [Int: [Int]] = [:]
        buildGraph(root, &graph)
        
        var queue: [Int] = [target.val]
        var visited: Set<Int> = [target.val]
        var result: [Int] = []
        var distance: Int = 0
        
        while !queue.isEmpty {
            let size: Int = queue.count
            for _ in 0..<size {
                let node: Int = queue.removeFirst()
                if distance == k {
                    result.append(node)
                }
                
                for nextNode in graph[node] ?? [] {
                    if visited.contains(nextNode) {
                        continue
                    }
                    
                    visited.insert(nextNode)
                    queue.append(nextNode)
                }
            }
            
            distance += 1
        }
        
        return result
    }
    
    private func buildGraph(_ root: TreeNode?, _ graph: inout [Int: [Int]]) {
        guard let root = root else { return }
        
        if let left = root.left {
            graph[root.val, default: []].append(left.val)
            graph[left.val, default: []].append(root.val)
            buildGraph(left, &graph)
        }
        
        if let right = root.right {
            graph[root.val, default: []].append(right.val)
            graph[right.val, default: []].append(root.val)
            buildGraph(right, &graph)
        }
    }
}