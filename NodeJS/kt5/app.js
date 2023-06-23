// const http = require("http")
// let message = "Привет мир!"
// http.createServer(function(request,response){
//     console.log(message)
//     response.end(message)
// }).listen(3000, "127.0.0.1", ()=>{
//     console.log("Начали слушать запросы")
// })

// function displayAsync(data, callback) {
//     //С помощью случайного числа определим ошибку
//     var randInt = Math.random() * (10 - 1) + 1
//     //Проверка на ошибку
//     var err = randInt > 5 ? new Error("Ошибка. randInt > 5") : null
//     //Асинхронная функция setTimeout
//     setTimeout(function () {
//         callback(err, data)
//     }, 0)
// }

// console.log("Начало работы")

// displayAsync("Обработка.........", function (err, data) {
//     if (err) throw err
//     console.log(data)
// })

// console.log("Завершение работы программы")

function displaySync(callback){
    callback()
}
console.log("Начало работы программы")

setTimeout(function(){
    console.log("timeout 500")
}, 500)

setTimeout(function(){
    console.log("timeout 100")
}, 100)

displaySync(function(){
    console.log("without timeout")
})
console.log("Завершение работы")