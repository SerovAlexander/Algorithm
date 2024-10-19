import UIKit

/*
 Написать структуру данных Дэк максимальный размер которого определяется заданным числом.
 Все операции должны выполняться за O(1)
 При реализации используйте кольцевой буфер.
 Операции:
 * push_back(value) – добавить элемент в конец дека. Если в деке уже находится максимальное число элементов, вывести «error».
 * push_front(value) – добавить элемент в начало дека. Если в деке уже находится максимальное число элементов, вывести «error».
 * pop_front() – вывести первый элемент дека и удалить его. Если дек был пуст, то вывести «error».
 * pop_back() – вывести последний элемент дека и удалить его. Если дек был пуст, то вывести «error».
 * Value — целое число, по модулю не превосходящее 1000.
*/

class Deque<T> {
    private var queue: [T?]
    private var head: Int
    private var tail: Int
    private var maxN: Int
    private var size: Int
    
    init(n: Int) {
        queue = [T?](repeating: nil, count: n)
        head = 0
        tail = 0
        maxN = n
        size = 0
    }
    
    func pushBack(_ x: T) {
        if size != maxN {
            queue[tail] = x
            tail = (tail + 1) % maxN
            size += 1
        } else {
            print("error")
        }
    }
    
    func pushFront(_ x: T) {
        if size != maxN {
            head = (head - 1 + maxN) % maxN
            queue[head] = x
            size += 1
        } else {
            print("error")
        }
    }
    
    func popFront() -> T? {
        if isEmpty() {
            return nil
        }
        let x = queue[head]
        queue[head] = nil
        head = (head + 1) % maxN
        size -= 1
        return x
    }
    
    func popBack() -> T? {
        if isEmpty() {
            return nil
        }
        tail = (tail - 1 + maxN) % maxN
        let x = queue[tail]
        queue[tail] = nil
        size -= 1
        return x
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
}

func createDequeAndExecuteСommands(dequeLength: Int, _ commands: [String]) {
    let deque = Deque<Int>(n: dequeLength)
    for command in commands {
        let parts = command.split(separator: " ")
        switch parts[0] {
        case "push_front":
            if parts.count == 2, let value = Int(parts[1]) {
                deque.pushFront(value)
            }
        case "push_back":
            if parts.count == 2, let value = Int(parts[1]) {
                deque.pushBack(value)
            }
        case "pop_front":
            if let value = deque.popFront() {
                print(value)
            } else {
                print("error oooooo")
            }
        case "pop_back":
            if let value = deque.popBack() {
                print(value)
            } else {
                print("errorpppppp")
            }
        default:
            break
        }
    }
}

createDequeAndExecuteСommands(dequeLength: 4, ["push_front 861", "push_front -862", "pop_back", "pop_back"]) // 861 -> -862
createDequeAndExecuteСommands(dequeLength: 6, ["push_front -201", "push_back 959", "push_back 102", "push_front 20", "pop_front", "pop_back"]) // 20 -> 102
createDequeAndExecuteСommands(dequeLength: 10, ["push_front -855", "push_front 0", "pop_back", "pop_back", "push_back 844", "pop_back", "push_back 823"]) // -855 -> 0 -> 844

