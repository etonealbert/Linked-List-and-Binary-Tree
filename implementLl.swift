
class Node {
    let value: Int 
    var next: Node?

    init(value: Int, next: Node?){
        self.value = value
        self.next = next 
    }
}

class LinkedList{   //we using it instead struct, because struct is hard to follow

    var head: Node?

    func insert(value: Int) {
        if head == nil {
            head = Node(value: value, next: nil)
            return
        }
        var current = head
        while current?.next != nil {    //ищет конец списка чтобы добавить
            current = current?.next 
        }
        current?.next = Node(value: value, next: nil)
        }

    func delete(value: Int) {
        if head?.value == value {
            head = head?.next      // point to head.next
        }

        var prev: Node?
        var current = head

        while current != nil && current?.value != value {
             prev = current
             current = current?.next
        }
        prev?.next = current?.next  // point through our item
    } 

    func displayListItems () {
        print("Here is whats inside of your list:")
        var current = head
        while current != nil {
            print(current?.value ?? "")
            current = current?.next
        }
    }// For interview requierd

    //-------------------- "Special Insert" -----------------
    // 1 -> 2 -> 3 -> 4 -> 5 -> nil sort insertion

    func insertInOrder (value: Int) {
        if head == nil || head?.value ?? Int.min >= value {
            let newNode = Node(value: value, next: head)
            head = newNode
            return
        }
        var currentNode: Node? = head
        while currentNode?.next != nil && currentNode?.next?.value ?? Int.min < value {
            currentNode = currentNode?.next
        }

        currentNode?.next = Node(value: value, next: currentNode?.next)
    }


    func setupDummyNodes() {
        let three = Node(value: 3, next: nil)
        let two = Node(value: 2, next: three)
        head = Node(value: 1, next: two)
    }

}

let sampleList = LinkedList()
sampleList.insert(value: 1)
sampleList.insert(value: 2)
sampleList.insert(value: 4)
sampleList.insert(value: 5)

sampleList.insertInOrder(value: 3)

// sampleList.delete(value: 2) // 1 -> 3
// 1 -> 2 -> nil

sampleList.displayListItems()

// print(sampleList.head?.value)
