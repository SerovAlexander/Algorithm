import UIKit

/*
 Написать ограниченную очередь с вставкой и удалением элементов из очереди за O(1).
 Очередь должна принимать параметр max_size, означающий максимально допустимое количество элементов в очереди.
 Методы которые необходимо реализовать:
 push(x) — добавить число x в очередь;
 pop() — удалить число из очереди и вывести на печать;
 peek() — напечатать первое число в очереди;
 size() — вернуть размер очереди;
 При превышении допустимого размера очереди нужно вывести «error».
 При вызове операций pop() или peek() для пустой очереди нужно вывести «None».
 */

struct MyQueueSized<T> {
    private var queue: [T?]
    private var head: Int
    private var tail: Int
    private var maxN: Int
    private var count: Int
    
    init(n: Int) {
        queue = [T?](repeating: nil, count: n)
        head = 0
        tail = 0
        maxN = n
        count = 0
    }
    
    mutating func push(_ value: T) {
        if count != maxN {
            queue[tail] = value
            count += 1
            tail = (tail + 1) % maxN
        } else {
            print("error")
        }
    }
    
    mutating func pop() -> T? {
        guard !isEmpty() else {
            return nil
        }
        
        let value = queue[head]
        queue[head] = nil
        head = (head + 1) % maxN
        count -= 1
        
        return value
    }
    
    func peek() -> T? {
        guard !isEmpty() else {
            return nil
        }
        
        return queue[head]
    }
    
    func size() -> Int {
        count
    }
    
    
    private func isEmpty() -> Bool {
        count == 0
    }
}

func makeQueueAndCommands(maxSize: Int, commands: [String]) {
    var queue = MyQueueSized<Int>(n: maxSize)
    
    for command in commands {
        let parts = command.split(separator: " ")
        switch parts[0] {
        case "pop":
            if let value = queue.pop() {
                print(value)
            } else {
                print("None")
            }
        case "size":
            print(queue.size())
        case "peek":
            if let value = queue.peek() {
                print(value)
            } else {
                print("None")
            }
        case "push":
            if parts.count == 2, let value = Int(parts[1]) {
                queue.push(value)
            }
        default:
            break
        }
    }
}

makeQueueAndCommands(maxSize: 1, commands: ["push 1", "size", "push 3", "size", "push 1", "pop", "push 1", "pop", "push 3", "push 3"]) //1 error 1 error 1 1 error
