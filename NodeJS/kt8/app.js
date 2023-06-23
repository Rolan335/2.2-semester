const http = require("http")
const fs = require("fs")

http.createServer(function (request, response){
    fs.readFile("index.html","utf-8", function(error,data){
        let message = "Изучаем"
        let header = "Main page"
        data = data.replace("{header}", header).replace("{message}",message)
        response.end(data)
    })
}).listen(3000, function () {
    console.log("Завёлся")
})


















// http.createServer(function(request,response){
//     response.setHeader("Content-Type", "text/html; charset=utf-8;")
//     console.log(`Вы запросили ${request.url}`)

//     const filePath = request.url.substr(1)

//     fs.access(filePath,fs.constants.R_OK, err =>{

//         if(err){
//             response.statusCode = 404
//             response.end("Response not found!")
//         }
//         else{
//             fs.createReadStream(filePath).pipe(response)
//         }
//     })
// }).listen(3000, function(){
//     console.log("Завёлся")
// })













// http.createServer(function(request,response){
//     response.setHeader("Content-Type", "text/html; charset=utf-8;")
//     if(request.url === "/home"){
//         response.write("<h1>Welcome home</h1>")
//     }
//     else if(request.url === "/about"){
//         response.write("<h2>Welcome whereabouts</h2>")
//     }
//     else if (request.url === "/contact"){
//         response.write("<h2>Who you gonna call?</h2>")
//     }
//     //Переадресация
//     else if (request.url === "/redir") {
//         response.statusCode = 302
//         response.setHeader("Location", "/newpage")
//     }
//     else if (request.url === "/newpage")(
//         response.write("<h2>New page!</h2>")
//     )
//     else{
//         response.statusCode = 404
//         response.write("<h2>404:(</h2>")
//     }
//     response.end()
// }).listen(3000)