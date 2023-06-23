const mysql = require("mysql2")

const pool = mysql.createPool({
    connectionLimit: 5,
    host: "127.0.0.1",
    port: "3306",
    user: "root",
    database: "Ground_Cargo_Database",
    password: "Pa$$w0rd"
}).promise()

const data = ['7555', '205814', '415-126-281 89', '3859302750383967', '4804', '291842', 'Кириллов', 'Кирилл', 'Кириллович']
const sql = `Insert into Driver (Driver_Passport_Series, Driver_Passport_Number, Driver_Snils, Driver_FFOMI, Driver_License_Series, Driver_License_Number, Driver_Surname, Driver_Name, Driver_Second_Name)
            values(?,?,?,?,?,?,?,?,?)`
pool.execute(sql, data)
    .then(result => {
        console.log(result[0])
        return pool.execute("SELECT * FROM Driver")
    })
    .then(result => {
        console.log(result[0])
        pool.end()
    })
    .then(() => {
        console.log("Пул закрыт")
    })
    .catch(function(err){
        console.log(err.message)
    })



// pool.query("SELECT * FROM driver", function (err, results) {
//     if (err) console.log(err)
//     console.log(results)
// })


// pool.end(function (err) {
//     if (err) {
//         return console.log(err.message)
//     }
//     console.log("пул закрыт")
// })