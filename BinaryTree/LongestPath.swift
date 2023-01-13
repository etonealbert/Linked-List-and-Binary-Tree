class Solution {

    var adj: [[Int]] = []
    var c: [Character] = []
    var longest = 1

    func dfs(_ i: Int) -> Int {
        if adj[i].isEmpty { return 1 }

        var longestChildOne = 0, longestChildTwo = 0
        for child in adj[i] {
            let path = dfs(child)
            if c[child] == c[i] { continue }
            if path > longestChildOne {
                longestChildTwo = longestChildOne
                longestChildOne = path
            } else if path > longestChildTwo {
                longestChildTwo = path
            }
        }
        longest = max(longest, longestChildOne + longestChildTwo + 1)
        return longestChildOne + 1
    }
    
    func longestPath(_ parent: [Int],_ s: String) -> Int {
        let n = parent.count
        c = Array(s)
        adj = Array(repeating: [], count: n)
        for i in 1..< n {
            adj[parent[i]].append(i)
        }

        dfs(0)
        return longest
    }
}