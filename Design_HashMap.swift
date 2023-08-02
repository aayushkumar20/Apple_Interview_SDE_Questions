// Design HashMap
// https://leetcode.com/problems/design-hashmap/

// Design a HashMap without using any built-in hash table libraries.
// Implement the MyHashMap class:

// MyHashMap() initializes the object with an empty map.
// void put(int key, int value) inserts a (key, value) pair into the HashMap. If the key already exists in the map, update the corresponding value.
// int get(int key) returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key.
// void remove(key) removes the key and its corresponding value if the map contains the mapping for the key.

// Example 1:
// Input
// ["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
// [[], [1, 1], [2, 2], [1], [3], [2, 1], [2], [2], [2]]
// Output
// [null, null, null, 1, -1, null, 1, null, -1]


class MyHashMap
{
    var hashMap: [Int: Int]
    
    /** Initialize your data structure here. */
    init()
    {
        hashMap = [Int: Int]()
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int)
    {
        hashMap[key] = value
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int
    {
        return hashMap[key] ?? -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int)
    {
        hashMap[key] = nil
    }
}