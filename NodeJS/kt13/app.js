const Sequelize = require("sequelize")
const sequelize = new Sequelize("Ground_Cargo_Database", "root", "Pa$$w0rd", {
    dialect: "mysql",
    host: "localhost",
    define:{
        timestamps: false
    }
})

const User = sequelize.define("user",{
    id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    age: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
})

// class User extends Model {}

// User.init({
//     id: {
//         type: Sequelize.INTEGER,
//         autoIncrement: true,
//         primaryKey: true,
//         allowNull: false
//     },
//     name: {
//         type: Sequelize.STRING,
//         allowNull: false
//     },
//     age: {
//         type: Sequelize.INTEGER,
//         allowNull: false
//     }
// }, {
//     sequelize,
//     modelName: "user"
// })

User.destroy({where:{id: 1}}).then(result => {
    console.log(result)
}).catch(err => console.log(err))
