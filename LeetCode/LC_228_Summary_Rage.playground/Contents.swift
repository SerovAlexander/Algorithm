import UIKit

/*
link: https://leetcode.com/problems/merge-sorted-array/description/
 
Дано отсортированное уникальное целочисленное массив nums.
Диапазон [a, b] — это множество всех целых чисел от a до b (включительно).
Верни наименьший отсортированный список диапазонов, который покрывает все числа в массиве ровно один раз.
То есть, каждый элемент из nums должен быть включён ровно в один диапазон, и не должно быть ни одного числа x, которое присутствует в диапазоне,
но отсутствует в nums.

Каждый диапазон [a, b] в списке должен быть выведен в следующем формате:

"a->b", если a != b
"a", если a == b
 
Input: nums = [0,1,2,4,5,7]
Output: ["0->2","4->5","7"]

Input: nums = [0,2,3,4,6,8,9]
Output: ["0","2->4","6","8->9"]
*/

func summaryRanges(_ nums: [Int]) -> [String] {
    guard !nums.isEmpty else {
        return []
    }
    guard nums.count > 1 else {
        return ["\(nums[0])"]
    }
    var result = [String]()
    var left = 0
    var right = 1
    
    while right <= nums.count - 1 {
        if nums[right] == nums[right - 1] + 1 {
            right += 1
        } else {
            if right - left > 1 {
                result.append("\(nums[left])->\(nums[right - 1])")
            } else {
                result.append("\(nums[left])")
            }
            left = right
            right += 1
        }
    }
    
    if right - left > 1 {
        result.append("\(nums[left])->\(nums[right - 1])")
    } else {
        result.append("\(nums[left])")
    }
    
    return result
}

func summaryRangesSecondEdition(_ nums: [Int]) -> [String] {
    guard !nums.isEmpty else { return [] }
    
    var start = nums[0]
    var result = [String]()
    
    for i in 1...nums.count {
        if i == nums.count || nums[i] != nums[i - 1] + 1 {
            if start == nums[i - 1] {
                result.append("\(start)")
            } else {
                result.append("\(start)->\(nums[i - 1])")
            }
            
            if i < nums.count {
                start = nums[i]
            }
        }
    }
    
    return result
}
print(summaryRanges([0,1,2,4,5,7]))
print(summaryRangesSecondEdition([0,1,2,4,5,7]))
