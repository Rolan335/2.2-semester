let array = [100, 124, 1296, 593, 286, 236, 346, 693, 935, 392, 697, 238, 2306, 286, 395, 2359, 2359, 12496, 693, 395, 196]
//Найти элемент массива

function consecutiveSearch(array, find) {
    let i = 0;
    while (find != array[i] && i < array.length) {
        i++
    }
    if (array[i] == find) {
        return i
    }
    else {
        return -1
    }
}

console.log(consecutiveSearch(array, 693))