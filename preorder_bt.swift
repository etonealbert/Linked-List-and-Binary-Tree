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

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return[] } 
        return printOrder(root)
    }

    func printOrder(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var rootValue = [root.val]
        var left = printOrder[root.left]
        var right = printOrder( root.right)
        return rootValue + left + right
    }
}

let kek = Solution()
var root: TreeNode {
    let zero = TreeNode(val: 1)
    let one = TreeNode(val: nil)
    let two = TreeNode(val: 2)
    let three = TreeNode(val: 3)
    zero.left = one
    zero.right = two
    two.right = three

    return zero
}()

print(kek.preorderTraversal(root))