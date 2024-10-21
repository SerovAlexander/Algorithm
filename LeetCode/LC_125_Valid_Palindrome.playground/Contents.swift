import Foundation

/*
link: https://leetcode.com/problems/merge-sorted-array/description/
 
Фраза является палиндромом, если после приведения всех заглавных букв к строчным и удаления всех неалфавитно-цифровых символов она читается одинаково
слева направо и справа налево. Алфавитно-цифровыми символами считаются буквы и цифры.

Дана строка s. Верни true, если она является палиндромом, или false в противном случае.
 
Input: s = "A man, a plan, a canal: Panama"
Output: true

Input: s = "race a car"
Output: false
 
Input: s = " "
Output: true
*/

func isPalindrome(_ s: String) -> Bool {
    let filteredStr = s.filter { $0.isNumber || $0.isLetter }.lowercased()
    var arrayStr = Array(filteredStr)
    
    guard !arrayStr.isEmpty else {
        return true
    }
    
    var left = 0
    var right = arrayStr.count - 1
    
    while left < right {
        if arrayStr[left] != arrayStr[right] {
            return false
        }
        left += 1
        right -= 1
    }
    
    return true
}

print(isPalindrome("A man, a plan, a canal: Panama")) //-> true
print(isPalindrome("race a car")) //-> false
print(isPalindrome(" ")) //-> true
