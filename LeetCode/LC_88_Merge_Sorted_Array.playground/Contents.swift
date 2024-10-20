import UIKit

/*
link: https://leetcode.com/problems/merge-sorted-array/description/
Вам даны два целочисленных массива nums1 и nums2, отсортированных в неубывающем порядке, и два целых числа m и n,
обозначающих количество элементов в nums1 и nums2 соответственно.

Объедините nums1 и nums2 в один массив, отсортированный в неубывающем порядке.

Конечный отсортированный массив не должен возвращаться функцией, а должен храниться внутри массива nums1.
Для этого nums1 имеет длину m + n, где первые m элементов обозначают элементы, которые должны быть объединены,
а последние n элементов имеют значение 0 и должны быть проигнорированы. nums2 имеет длину n.
 
Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
Output: [1,2,2,3,5,6]
 
Input: nums1 = [1], m = 1, nums2 = [], n = 0
Output: [1]
 
Input: nums1 = [0], m = 0, nums2 = [1], n = 1
Output: [1]
 
Алгоритм - объявляем 3 переменные: индексы последних элементов в массивах nums1 и nums2 и индекс последнего возможного элемента в массиве nums1.
Делаем цикл пока один из индексов не станет < 0. В цикле сравниваем значения по индексам и добавляем в конец nums1 больший элемент.
Уменьшая идексы указываюшие на массив от куда взяли элемент и куда далее будем вставлять. Если в массиве nums2 еще остались элементы
то просто добавляем их по индексу mergeIndex уменьшая каждый цикл его значение.
*/



func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var nums1Index = m - 1
    var nums2Index = n - 1
    var mergeIndex = n + m - 1
    
    while nums1Index >= 0 && nums2Index >= 0 {
        if nums1[nums1Index] > nums2[nums2Index] {
            nums1[mergeIndex] = nums1[nums1Index]
            nums1Index -= 1
        } else {
            nums1[mergeIndex] = nums2[nums2Index]
            nums2Index -= 1
        }
        
        mergeIndex -= 1
    }
    
    while nums2Index >= 0 {
        nums1[mergeIndex] = nums2[nums2Index]
        nums2Index -= 1
        mergeIndex -= 1
    }
}

var array1 = [1,2,3,0,0,0]

merge(&array1, 3, [2,5,6], 3)
print(array1)  // - > [1,2,2,3,5,6]
