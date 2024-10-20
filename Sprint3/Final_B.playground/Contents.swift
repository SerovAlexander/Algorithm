import UIKit

/*
Обратная польская нотация
 3 4 + - > 3 + 4 -> 7
 10 2 4 * - -> 10 - 2 * 4 -> 2
*/

func calculate(_ str: String) -> Int {
    var stack = [Double]()
    let arrayStr = str.split(separator: " ").map { String($0) }
    for element in arrayStr {
        if let element = Double(element) {
            stack.append(element)
        } else {
            if let secondElement = stack.popLast(),
                let firstElement = stack.popLast(),
                let sign = SignType(with: element) {
                stack.append(calculateHelp(firstElement: firstElement, secondElement: secondElement, sign: sign))
            }
        }
    }
    
    return Int(stack.popLast() ?? 0)
}

func calculateHelp(firstElement: Double, secondElement: Double, sign: SignType) -> Double {
    switch sign {
    case .multiply:
        return firstElement * secondElement
    case .divide:
        return floor(firstElement / secondElement)
    case .plus:
        return firstElement + secondElement
    case .minus:
        return firstElement - secondElement
    }
}

enum SignType {
    case multiply
    case divide
    case plus
    case minus
    
    init?(with char: String) {
        switch char {
        case "*":
            self = .multiply
        case "/":
            self = .divide
        case "+":
            self = .plus
        case "-":
            self = .minus
        default:
            return nil
        }
    }
}

print(calculate("4 13 5 / +")) // -> 16
print(calculate("10 2 4 * -")) // -> 2
