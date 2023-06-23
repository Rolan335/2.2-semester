function binSearch(arr, item) {
    let high = arr.length - 1
    let low = 0
    let mid;
    while (low <= high) {
        mid = high + low
        t = arr[mid]
        if (item > arr[mid]) {
            low = mid + 1
        }
        else if (item < arr[mid]) {
            high = mid - 1
        }
        else {
            return mid
        }
    }
    return mid
}
let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
let item = 7
console.log(binSearch(arr, item))

//О() считает количество операций
//O(logn) = O(log<sub>2</sub>n)

//      arr     list
//read  O(1)    O(n)
//ins   O(n)    O(1)(если знаем где элемент)
//del   O(n)    O(1)(если знаем где элемент)