// Time Based Key-Value Store
// Link: https://leetcode.com/problems/time-based-key-value-store/

// Design a time-based key-value data structure that can store multiple values for the same key at different time stamps and retrieve the key's value at a certain timestamp.
// Implement the TimeMap class:
// TimeMap() Initializes the object of the data structure.
// void set(String key, String value, int timestamp) Stores the key key with the value value at the given time timestamp.
// String get(String key, int timestamp) Returns a value such that set was called previously, with timestamp_prev <= timestamp. If there are multiple such values, it returns the value associated with the largest timestamp_prev. If there are no values, it returns "".

// Example 1:
// Input
// ["TimeMap", "set", "get", "get", "set", "get", "get"]
// [[], ["foo", "bar", 1], ["foo", 1], ["foo", 3], ["foo", "bar2", 4], ["foo", 4], ["foo", 5]]
// Output
// [null, null, "bar", "bar", null, "bar2", "bar2"]

// Example 2:
// Input
// ["TimeMap", "set", "set", "get", "get", "get", "get", "get"]
// [[], ["love", "high", 10], ["love", "low", 20], ["love", 5], ["love", 10], ["love", 15], ["love", 20], ["love", 25]]
// Output
// [null, null, null, "", "high", "high", "low", "low"]

class TimeMap{
    var map = [String: [(Int, String)]]()
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        if map[key] == nil {
            map[key] = [(timestamp, value)]
        } else {
            map[key]!.append((timestamp, value))
        }
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        if map[key] == nil {
            return ""
        }
        
        let arr = map[key]!
        var left = 0
        var right = arr.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if arr[mid].0 == timestamp {
                return arr[mid].1
            } else if arr[mid].0 < timestamp {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return right < 0 ? "" : arr[right].1
    }
}