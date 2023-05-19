function generateArr(num) {
    const arr = []
    for (let i = 0; i < num; i++) {
        arr.push(Math.floor(Math.random() * 100000))
    }
    return arr
}


function insertion(arr){
    for (let i = 0; i < arr.length; i++){
        let j = i - 1
        let temp = arr[i]
        while (j >= 0 && temp < arr[j]){
            arr[j + 1] = arr[j]
            j--
        }
        arr[j + 1] = temp
    }
    return arr
}


function quick(arr) {
    if (arr.length < 2) return arr;
    let min = 1;
    let max = arr.length - 1
    let pivVal = Math.floor(min + Math.random() * (max + 1 - min));
    let pivot = arr[pivVal]
    const left = []
    const right = []
    arr.splice(arr.indexOf(pivot), 1)
    arr = [pivot].concat(arr)
    for (let i = 0; i < arr.length - 1; i++) {
        if (pivot > arr[i]) {
            left.push(arr[i])
        }
        else {
            right.push(arr[i])
        }
    }
    return quick(left).concat(pivot, quick(right))
}

const arr = generateArr(100000)
const arrBest = generateArr(100000).sort()
const arrWorst = generateArr(100000).sort().reverse()

console.time('insertion Best')
insertion(arrBest)
console.timeEnd('insertion Best')

console.time('insertion')
insertion(arr)
console.timeEnd('insertion')

console.time('insertionWorst')
insertion(arrWorst)
console.timeEnd('insertionWorst')


// console.time('quick Best')
// quick(arrBest)
// console.timeEnd('quick Best')

// console.time('quick')
// quick(arr)
// console.timeEnd('quick')

// console.time('quickWorst')
// quick(arrWorst)
// console.timeEnd('quickWorst')

