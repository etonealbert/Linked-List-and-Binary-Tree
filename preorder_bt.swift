public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode? ) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class BTreeAnalaizer {
    func isSameTree(_ p: TreeNode?,_ q: TreeNode?) -> Bool {
        if p?.val != q?.val { return false }
        if p == nil && q == nil { return true}
        if p == nil && q != nil {return false}
        if q == nil && p != nil { return false}
        return isSameTree( p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}

class PreorderBT {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return[] } 
        return printOrder(root)
    }

    private func printOrder(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        let rootValue = [root.val]
        let left = printOrder(root.left)
        let right = printOrder( root.right)
        return rootValue + left + right
    }

    func sortedArrayToBT(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else {return nil }
        let root = bst(nums, start: 0, end: nums.count - 1)
        return root
    }

    private func bst(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
        guard start <= end else {
            return nil 
        }

        let rootIndex = start + (end - start)/2
        let rootNode = TreeNode(nums[rootIndex])
        rootNode.left = bst(nums, start: start, end: rootIndex - 1)
        rootNode.right = bst(nums, start: rootIndex+1, end: end)

        return rootNode
    }

}

let basic = PreorderBT()
let array : [Int] = [2,1,3]
let root = basic.sortedArrayToBT(array)
print(basic.preorderTraversal(root))
