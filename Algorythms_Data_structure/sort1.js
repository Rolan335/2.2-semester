function bubble(arr) {
    let count = 0
    for (let i = 0; i < arr.length - 1; i++) {
        for (let j = 0; j < arr.length - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                let temp = 0
                temp = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = temp
                temp = 0
                count++
            }
        }
    }
    console.log(arr, count)
}

let arr = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
bubble(arr)

// function insertion(arr) {
//     for (let i = 0; i < arr.length; i++) {
//         let temp = arr[i]
//         j = i - 1
//         while (j >= 0 && temp < arr[j]) {
//             arr[j + 1] = arr[j]
//             j--
//         }
//         arr[j + 1] = temp
//     }
//     return arr
// }
// console.log(insertion(arr))

// function selection(arr) {
//     for (let i = 0; i < arr.length; i++){
//         let lowest = i
//         for (let j = 0; j < arr.length; j++){
//             if (arr[j] < arr[lowest]){
//                 lowest = j
//                 let temp = 0
//                 temp = arr[i]
//                 arr[i] = arr[lowest]
//                 arr[lowest] = temp
//                 temp = 0
//             }
//         }
//     }
//     return arr.reverse()
// }
// console.log(selection(arr))
function shake(arr) {
    let count = 0
    for (let i = 0; i < arr.length - 1; i++) {
        for (let j = 0; j < arr.length - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                let temp = 0
                temp = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = temp
                temp = 0
                count++
            }
        }
        for (let j = arr.length - i - 1; j > i; j--) {
            if (arr[j] < arr[j - 1]) {
                let temp = 0
                temp = arr[j - 1]
                arr[j - 1] = arr[j]
                arr[j] = temp
                temp = 0
                count++
            }
        }
    }
    console.log(arr, count)
}
let arr1 = [10,9,8,7,6,5,4,3,2,1]
console.log(arr1)

shake(arr1)