
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

    func insert() {

    }

    func setupDummyNodes() {
        let three = Node(value: 3, next: nil)
        let two = Node(value: 2, next: three)
        head = Node(value: 1, next: two)
    }

}

let sampleList = LinkedList()
sampleList.setupDummyNodes()
print(sampleList.head?.value)
