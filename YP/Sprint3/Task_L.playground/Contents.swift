/*
 У нас есть массив, в котором указано, сколько денег накопилось на конец каждого дня. Нужно определить:

 Первый день, когда сумма накоплений достигла или превысила заданное значение target1.
 Первый день, когда сумма накоплений достигла или превысила удвоенное значение, то есть target2 = 2 * target1.
 Решение должно быть эффективным, с временем работы O(log n)

*/
func findDaysForBicycles(price: Int, days: [Int]) -> String {
    let firstDayForOneBike = binarySearch(target: price, days: days, left: 0, right: days.count - 1)
    let firstDayForTwoBikes = binarySearch(target: price * 2, days: days, left: 0, right: days.count - 1)
    
    return "\(firstDayForOneBike) \(firstDayForTwoBikes)"
}

func binarySearch(target: Int, days: [Int], left: Int, right: Int) -> Int {
    print("left = \(left), right = \(right)")
    if left > right { return -1 }
    
    let mid = (left + right) / 2
    
    print("mid - \(mid)")
    
    if target <= days[mid] {
        if mid == 0 || days[mid - 1] < target {
            return mid + 1
        } else {
            return binarySearch(target: target, days: days, left: left, right: mid)
        }
    } else {
        return binarySearch(target: target, days: days, left: mid + 1, right: right)
    }
}


print(findDaysForBicycles(price: 4, days: [1,1,4,4,4,4,8]))
