import UIKit

/*
 J. Списочная очередь
 Написать очередь с использованием связного списка.
 Очередь должна поддерживать выполнение трёх команд:
 get() — вывести элемент, находящийся в голове очереди, и удалить его. Если очередь пуста, то вывести «error».
 put(x) — добавить число x в очередь
 size() — вывести текущий размер очереди
*/

open class Node {
   public var value: String
   public var next: Node?

   public init(_ value: String) {
     self.value = value
     self.next = nil
   }
 }

struct LinkedListQueue {
    private var queueHead: Node?
    private var queueTail: Node?
    private var count: Int
    
    
    init(queueHead: Node? = nil) {
        self.queueHead = queueHead
        self.queueTail = queueHead
        self.count = 0
    }
    
    mutating func get() -> Node? {
        guard queueHead != nil else {
            return nil
        }
        let head = queueHead
        queueHead = queueHead?.next
        count -= 1
        
        if queueHead == nil {
            queueTail = nil
        }
        return head
    }
    
    mutating func put(_ value: String) {
        let newNode = Node(value)
        if queueHead == nil {
            queueHead = newNode
            queueTail = newNode
        } else {
            queueTail?.next = newNode
            queueTail = queueTail?.next
        }
        count += 1
    }
    
    func size() -> Int {
        count
    }
}

func makeQueueAndCommands(commands: [String]) {
    var queue = LinkedListQueue()
    
    for command in commands {
        let parts = command.split(separator: " ")
        switch parts[0] {
        case "get":
            if let node = queue.get() {
                print(node.value)
            } else {
                print("error")
            }
        case "size":
            print(queue.size())
        case "put":
            if parts.count == 2 {
                queue.put(String(parts[1]))
            }
        default:
            break
        }
    }
}

makeQueueAndCommands(commands: ["put -34", "put -23","get", "size", "get", "size", "get", "get", "put 80", "size"]) // -34 -> 1 -> -23 -> 0 -> error -> error -> 1
