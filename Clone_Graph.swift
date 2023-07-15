// Clone Graph
// https://leetcode.com/problems/clone-graph/

// Given a reference of a node in a connected undirected graph.
// Return a deep copy (clone) of the graph.
// Each node in the graph contains a value (int) and a list (List[Node]) of its neighbors.

// class Node {
//     public int val;
//     public List<Node> neighbors;
// }

//Sample input:
// adjList = [[2,4],[1,3],[2,4],[1,3]]
// Output: [[2,4],[1,3],[2,4],[1,3]]

class Solution
{
    var hm = [Int: Node]()
    func cloneGraph(_ node: Node?) -> Node?
    {
        if node == nil { return nil }
        if let n = hm[node!.val] { return n }
        let root = Node(node!.val)
        hm[node!.val] = root
        for neighbor in node!.neighbors
        {
            root.neighbors.append(cloneGraph(neighbor)!)
        }
        return root
    }
}