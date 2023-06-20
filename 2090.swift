class Solution {
    func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
        guard k != 0 else { return nums }
        let n = nums.count
        var result = Array(repeating: -1, count: n)
        guard n > 2 * k else { return result }
        
        var sum = 0
        for i in 0...(2 * k) {
            sum += nums[i]
        }
        
        for i in k..<(n - k) {
            result[i] = sum / (2 * k + 1)
            sum -= nums[i - k]
            if i + k + 1 < n {
                sum += nums[i + k + 1]
            }
        }
        
        return result
    }
}
