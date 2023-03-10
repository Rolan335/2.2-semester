//1
/*
    а) В алгоритме имеются 2 цикла, один из них вложенный. один идёт сначала, другой идёт с конца (чем дальше, тем меньше) -> сложность алгоритма O(n^2)
    б) В алгоритме имеются 2 цикла, вложенный цикл while итерируется по массиву, пока не найдёт искомый элемент  -> сложность алгоритма O(n^2 / 2)
*/

//2
/*
a) n
b) n^2
c) n*log(n)
d) n!
*/


//3
/*
                1      2
    n = 14 -  19600  16354
    n = 15 -  22500  32768
    ответ - 15
*/

// 5. Решить уравнение х^4 + 3х = 5 для х > 0 с точностью 0.0001.
// Oцените вычислительную сложность. Зарипов
function solveEq(a, b, c, acc) {
    function f(x) {
        return x ** a + b * x - c
    }

    let r = 1;
    while (f(r) * f(-r) >= 0) {
        r = r * 2
    }
    let l = -r
    console.log(l, r)

    while (r - l > acc) {
        x = (l + r) / 2
        if (f(x) * f(r) > 0) {
            r = x
        }
        else {
            l = x
        }
    }
    return x
}
console.log(solveEq(4, 3, 5, 0.0001))

//Вычислительная сложность O(1 + n + log(n))
