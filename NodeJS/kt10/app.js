const mysql = require("mysql2")



const connection = mysql.createConnection({
    host: "127.0.0.1",
    port: "3306",
    database: "usersdb",
    user: "root",
    password: "Pa$$w0rd"
})

const users = [
    ["Rob", 22],
    ["ecilA", 25],
    ["Kate", 19]
]

const sql = `SELECT * FROM USERS`
connection.query(sql,function(err,results){
        if(err) console.log(err)
        else console.log(results)
    })

connection.end()







// const connection = mysql.createConnection({
//     host: "127.0.0.1",
//     port: "3306",
//     user: "root",
//     database: "Ground_Cargo_Database",
//     password: "Pa$$w0rd"
// }).promise()

// connection.query("SELECT * FROM driver")
//             .then(result =>{
//                 console.log(result)
//             })
//             .catch(err =>{
//                 console.log(err)
//             })

// connection.connect(function(err){
//     if (err){
//         return console.log("Ошибка" + err.message)
//     }
//     else{console.log("Подключение установлено")}
// })

// // ('7702', '205814', '415-126-281 82', '3859302759383967', '4804', '291842', 'Кириллов', 'Кирилл', 'Кириллович'),

// const user = ['7702', '205814', '415-126-281 82', '3859302759383967', '4804', '291842', 'Кириллов', 'Кирилл', 'Кириллович']
// const sql = `Insert into Driver (Driver_Passport_Series, Driver_Passport_Number, Driver_Snils, Driver_FFOMI, Driver_License_Series, Driver_License_Number, Driver_Surname, Driver_Name, Driver_Second_Name)
//             values(?,?,?,?,?,?,?,?,?)`

// connection.query(sql,user, function(err,results){
//     if(err) console.log(err)
//     else console.log("ДАННЫЕ ДОБАВЛЕНЫ")
// })

// connection.end(function (err) {
//     if (err) {
//         return console.log("Ошибка" + err.message)
//     }
//     else { console.log("Подключение закрыто") }
// })