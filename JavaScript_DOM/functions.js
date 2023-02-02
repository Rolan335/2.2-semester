const getNumber = function (a = 101, b = 0) {
    return Math.floor(Math.random() * (a - b) + b)
}

const getColor = function (a = 100) {
    return `rgba(${getNumber(256)},${getNumber(256)},${getNumber(256)}, ${a / 100})`
}