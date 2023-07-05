// Best time to buy and sell stock
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
// You are given an array prices where prices[i] is the price of a given stock on the ith day.
// You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
// Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
// Example 1:
// Input: prices = [7,1,5,3,6,4]
// Output: 5

class Solution {                   
    func maxProfit(_ prices: [Int]) -> Int {                   
        var maxProfit = 0                   
        var minPrice = Int.max                   
        for i in 0..<prices.count {                   
            if prices[i] < minPrice {                   
                minPrice = prices[i]                   
            }                   
            if prices[i] - minPrice > maxProfit {                   
                maxProfit = prices[i] - minPrice                   
            }                   
        }                   
        return maxProfit                   
    }                   
}