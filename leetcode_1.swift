
  //Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }
 
class Solution {

    var head: ListNode?

    func setupDummyNodes() -> ListNode? {
        let four = ListNode( 1,  nil)
        let three = ListNode( 2,  four)
        let two = ListNode(2,  three)
        head = ListNode( 1,  two)
        return head
    }

    func displayListItems (_ head: ListNode?) {

        print("Here is whats inside of your list:")

        var current = head

        while current != nil {
            print(current?.val ?? "")
            current = current?.next
        }

    }

    func isPalindrome(_ head: ListNode?) -> Bool {
        let kek : ListNode? = head
        var curr = head
        var arr : [Int] = []

        
        while curr != nil {
            arr.append(curr!.val)
            curr = curr?.next
        } 
        print(arr)
        if arr.count % 2 != 0 {
            return false
        }
        for i in 0...(arr.count/2-1){
            if arr[i] != arr[arr.count-1-i]{
                return false
            }
        }
        
        return true
    }
}
let sample = Solution()
let kek = sample.setupDummyNodes()
sample.displayListItems(kek)
print(sample.isPalindrome(kek))
