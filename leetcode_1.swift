
  //Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      init(val: Int, next: ListNode?){
        self.val = val
        self.next = next 
    }
    //   public init() { self.val = 0; self.next = nil; }
    //   public init(_ val: Int) { self.val = val; self.next = nil; }
    //   public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }
 
class Solution {

    var head: ListNode?

    func setupDummyNodes() -> ListNode? {
        let three = ListNode(val: 3, next: nil)
        let two = ListNode(val: 2, next: three)
        head = ListNode(val: 1, next: two)
        return head
    }

    func isPalindrome(_ head: ListNode?) -> Bool {



        
        
        let kek = head
        var curr: ListNode? = head
        var temp: ListNode?
        
        while curr != nil {
            let second : ListNode? = curr!.next
            curr!.next = temp
            temp = curr
            curr = second
        }
        
        // while kek != nil{
        //     var com1 = kek?.val 
        //     var com2 = temp?.val
        //     if com1 != com2 {
        //         return false
        //     }
        //     kek = kek?.next
        //     temp = temp?.next
        // }

        print(temp!.val == kek!.val)
        
        return (temp!.val == kek!.val)
    }
}
let sample = Solution()
let kek = sample.setupDummyNodes()
print(sample.isPalindrome(kek))