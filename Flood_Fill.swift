// Flood fill
// Link: https://leetcode.com/problems/flood-fill/

// An image is represented by an m x n integer grid image where image[i][j] represents the pixel value of the image.
// You are also given three integers sr, sc, and color. You should perform a flood fill on the image starting from the pixel image[sr][sc].
// To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color), and so on. Replace the color of all of the aforementioned pixels with color.
// Return the modified image after performing the flood fill.

// Example 1:
// Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, newColor = 2
// Output: [[2,2,2],[2,2,0],[2,0,1]]

// Example 2:
// Input: image = [[0,0,0],[0,0,0]], sr = 0, sc = 0, newColor = 2
// Output: [[2,2,2],[2,2,2]]

class Solution
{
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]]
    {
        var image = image
        let oldColor = image[sr][sc]
        
        if oldColor != newColor
        {
            fill(&image, sr, sc, oldColor, newColor)
        }
        
        return image
    }
    
    func fill(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ oldColor: Int, _ newColor: Int)
    {
        if sr < 0 || sr >= image.count || sc < 0 || sc >= image[0].count || image[sr][sc] != oldColor
        {
            return
        }
        
        image[sr][sc] = newColor
        
        fill(&image, sr - 1, sc, oldColor, newColor)
        fill(&image, sr + 1, sc, oldColor, newColor)
        fill(&image, sr, sc - 1, oldColor, newColor)
        fill(&image, sr, sc + 1, oldColor, newColor)
    }
}