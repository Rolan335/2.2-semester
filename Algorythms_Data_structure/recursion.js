// function sum(a) {
//     let ind = a
//     ind--
//     if (ind == 0) {
//         return a
//     }
//     return a += sum(a - 1)

// }
// console.log(sum(100))
// //wtf is this



// function pow(x, n) {
//     if (n == 1) {
//         return x
// //     }
// //     return (x * pow(x, n - 1))
// // }
// // console.log(pow(10, 10))

// // function fibonnachi(n) {
// //     if (n <= 1) {
// //         return n
// //     }
// //     else {
// //         return fibonnachi(n - 1) + fibonnachi(n - 2)
// //     }
// // }
// // console.log(fibonnachi(5))




// // function fibonnachi2(n){
// //     if (n == 0){return 0}
// //     if (n == 1){return 1}
// //     if (arr[n]>0){return arr[n]}
// //     return arr[n] = fibonnachi2(n - 1)+ fibonnachi2(n - 2)
// // }
// // console.log(fibonnachi2(5))


// //1
// function factorial(n){
//     if (n == 1) {return 1}
//     else{
//         return n * factorial(n-1)
//     }
// }
// console.log(factorial(5))

// //2
// function pow(n, m){
//     if (m == 0){ 
//         return 1
//     }
//     else{
//         return n * pow(n, m - 1)
//     }
// }
// console.log(pow(10,5))

// let sum = 0
// function count(str, letter){
//     if (str.length == 0){
//         return sum
//     }
//     else{
//         if(str.slice(-1) == letter){
//             sum++
//             str = str.slice(0, -1)
//             return count(str, letter)
//         }
//         else{
//             str = str.slice(0, -1)
//             return count(str, letter)
//         }
//     }
// }

// console.log(count("aajjjafjavja","a")) // 5 букв a

// function reverse(num = 12345){
//     if (num % num / 10)
// }
console.log(12345 % 1000)