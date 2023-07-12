// Coin Change
// https://leetcode.com/problems/coin-change/

// You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.
// Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
// You may assume that you have an infinite number of each kind of coin.

// Example 1:
// Input: coins = [1,2,5], amount = 11
// Output: 3

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard coins.count != 0 else {
            return 0
        }
        if amount == 0 {
            return 0
        }
        
        var queue : [(curBalance : Int, noOfCoins : Int)] = [(0,0)]
        var seen : Set<Int> = [0]
        
        while queue.count > 0 {
            let curElement = queue.removeFirst()
            
            let curBalance = curElement.curBalance
            let noOfCoins = curElement.noOfCoins
            
            if  curBalance == amount {
                return noOfCoins
            }
            
            for coin in coins {
                let amtReachable = curBalance + coin
                if amtReachable <= amount && !seen.contains(amtReachable) {
                    queue.append( (amtReachable,noOfCoins+1) )  
                    seen.insert(amtReachable)
                }
            }   
        }

        return -1
    }
}