// var kWeakestRows = function (mat, k) {
//     let count = 0
//     let arr = []
//     for (let i = 0; i < mat.length; i++) {
//         for (let j = 0; j < mat[i].length; j++) {
//             if (mat[i][j] == 1) { count++ }
//         }
        
//     }
//     let res = []
//     for (let i = 0; i <= k; i++) {
//         console.log(Math.min(...arr))
//         res.push(arr.indexOf(Math.min(arr)))
//         arr.pop(arr.indexOf(res[i]))
//     }
//     return arr
// };

// console.log(kWeakestRows([[1, 1, 0, 0, 0], [1, 1, 1, 1, 0], [1, 0, 0, 0, 0], [1, 1, 0, 0, 0], [1, 1, 1, 1, 1]], 3))


// var canConstruct = function (ransomNote, magazine) {
//     let i = 0;
//     let j = 0;
//     do {
//         j++
//         console.log(ransomNote[i], magazine[j])
//         if (j + 1 == magazine.lenght && ransomNote[i] != magazine[j]){break}
//         else{continue}
//     } while (ransomNote[i] != magazine[j]);
//     i++
//     magazine = magazine.replace(magazine[j],'')
//     if(ransomNote.lenght == i && ransomNote.contains(magazine)){
//         return true
//     }
//     return false
// };

// // console.log(canConstruct("a","b"))

// var generate = function (numRows) {
//     let arr = [1]
//     if(arr.length == 1){
//         arr.push([1,1])
//     }
//     while(arr.length != numRows - 1){
//         arr.push([arr[0],arr[1]])
//     }
//     return arr
// }

// // 1   1
// // 2  1 1
// // 3 1 2 1

// console.log(generate(5))


var canConstruct = function (ransomNote, magazine) {
    for (let i = 0; i < ransomNote.length; i++) {
        let t = ransomNote[i]
        console.log(ransomNote[i])
        if (magazine.includes(t)) {
            magazine.replace(t, '')
            console.log(magazine)
            continue
        }
        return false
    }
    return true
};

canConstruct("aa","ab")