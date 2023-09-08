// Zig-Zag Conversion

// Link: https://leetcode.com/problems/zigzag-conversion/

// The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

// P   A   H   N
// A P L S I I G
// Y   I   R
// And then read line by line: "PAHNAPLSIIGYIR"

// Write the code that will take a string and make this conversion given a number of rows:

// string convert(string s, int numRows);

// Example 1:

// Input: s = "PAYPALISHIRING", numRows = 3
// Output: "PAHNAPLSIIGYIR"
// Example 2:

// Input: s = "PAYPALISHIRING", numRows = 4
// Output: "PINALSIGYAHRPI"
// Explanation:
// P     I    N
// A   L S  I G
// Y A   H R
// P     I
// Example 3:

// Input: s = "A", numRows = 1
// Output: "A"

class Solution{
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        
        var rows = Array(repeating: "", count: numRows)
        var curRow = 0
        var goingDown = false
        
        for c in s {
            rows[curRow].append(c)
            if curRow == 0 || curRow == numRows - 1 {
                goingDown = !goingDown
            }
            curRow += goingDown ? 1 : -1
        }
        
        var ret = ""
        for row in rows {
            ret += row
        }
        
        return ret   
    }
}

// time complexity: O(n)
// space complexity: O(n)