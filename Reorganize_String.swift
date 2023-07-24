// Reorganize String
// Link: https://leetcode.com/problems/reorganize-string/

// Given a string s, rearrange the characters of s so that any two adjacent characters are not the same.
// Return any possible rearrangement of s or return "" if not possible.

// Example - 1
// Input: s = "aab"
// Output: "aba"

class Solution {
    func reorganizeString(_ S: String) -> String {
        var arr = Array(S)
        let first = helper(&arr)
        if first.isEmpty{
            arr = arr.reversed()
            return helper(&arr)
        }
        return first
    }
    
    func helper(_ arr: inout [Character]) -> String {
        let n = arr.count
        if n < 2 { return String(arr)}
        var i = 1
        while i < n-1{
            if arr[i] == arr[i-1]{
                var j = i+1
                while j < n && arr[i] == arr[j] {
                    j += 1
                }
                if j == n { return ""}
                swap(&arr, i, j)
            }
            i += 1
        }
        if arr[n-1] == arr[n-2] {
            if arr[n-1] == arr[0] {
                return ""
            }
            let last = arr.removeLast()
            arr.insert(last, at: 0)
        }
        return String(arr)
    }
    
   func swap(_ arr:inout[Character],_ i:Int,_ j:Int){
       let item = arr[i]
       arr[i] = arr[j]
       arr[j] = item
   }
}