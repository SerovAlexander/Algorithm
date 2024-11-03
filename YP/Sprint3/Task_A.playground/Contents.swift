/*
 Hадо сгенерировать все ПСП длины 2n в алфавитном порядке —– алфавит состоит из ( и ) и открывающая скобка идёт раньше закрывающей.
 
 Пример. Надо вывести ПСП из четырёх символов. Таких всего две:
 (())
 ()()
 (()) идёт раньше ()(), так как первый символ у них одинаковый, а на второй позиции у первой ПСП стоит (, который идёт раньше ).
*/


func generateParentheses(n: Int) {
    generateParentheses2(open: n, close: n, prefix: "")
}

func generateParentheses2(open: Int, close: Int, prefix: String) {
    if open == 0 && close == 0 {
        print(prefix)
        return
    }

    if open > 0 {
        generateParentheses2(open: open - 1, close: close, prefix: prefix + "(")
    }
    
    if close > open {
        generateParentheses2(open: open, close: close - 1, prefix: prefix + ")")
    }
}

generateParentheses(n: 4)  // -> (()) ()()
