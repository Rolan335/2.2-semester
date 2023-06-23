function small(arr) {
    let smallest = arr[0]
    let smallestInd = 0
    for (let i = 1; i < arr.length; i++) {
        if (arr[i] < smallest) {
            smallest = arr[i]
            smallestInd = i
        }
    }
    return smallestInd
}

function selectionSort(arr) {
    let arrSorted = []
    let arrCopy = arr.slice()
    for (let i = 0; i < arr.length; i++) {
        let smallestInd = small(arrCopy)
        arrSorted.push(arrCopy[smallestInd])
        arrCopy.splice(smallestInd, 1)[0]
    }
    return arrSorted
}

let arr = [2, 4, 5, 21, 99, 512, 523, 552, 2, 5, 6, 8, 2, 2, 1, 6, 8, 8, 9]
console.log(arr)
console.log(selectionSort(arr))

//  подаём массив -> копируем исходный массив в новую переменную ->
//  для каждого элемента массива(находим наименьший элемент в скопированном массиве ->
//  перемещаем в начало сортированного массива -> 
//  удаляем меньший элемент копии массива)
// Итог: Кол-во операций в худшем случае(каждый эл. массива * каждый эл. копии массива(за каждую итерацию убираем 1 элемент)) ->
//O(n^2)